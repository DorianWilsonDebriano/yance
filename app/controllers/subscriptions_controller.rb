class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @membership = Membership.find_by(title: params[:title])
    @user = current_user
    @subscription = Subscription.new
    authorize @subscription
  end

  def create
    skip_authorization
    @membership = Membership.find(params[:membership_id])
    @user = current_user
    #if the email of the user is already on the stripe database then update the existing customer
    if
      @membership == current_user.membership
      redirect_to memberships_path, notice: "You already have an active subscription."
    elsif stripe_customer?(@user)
      #if true call a method to update existing customer on stripe
      customer = update_stripe_customer(@user)
      @session = create_checkout_session(customer, @user)
      session[:token] = @user.session_token
      render :checkout
    elsif !stripe_customer?(@user)
      customer = create_stripe_customer(@user)
      @session = create_checkout_session(customer, @user)
      session[:token] = @user.session_token
      render :checkout
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def success
    skip_authorization
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = Stripe::Customer.retrieve(@session.customer)
    if @session.payment_status == "paid"
      flash.notice = "Congratulations #{current_user.first_name}!
                        You are now subscribed to the #{@session.metadata.membership_title}."
    end
  end

  private

  def create_stripe_customer(user)
    customer = Stripe::Customer.create(
      email: current_user.email,
      metadata: {
        selected_membership: @membership,
        membership_title: @membership.title
      }
    )
    user.update!(stripe_customer_id: customer.id)
    customer
  end

  def create_checkout_session(customer, user)
    price = Stripe::Price.list(lookup_keys: [@membership.title]).data.first
    @checkout_session = Stripe::Checkout::Session.create(
      {
        customer: current_user.stripe_customer_id,
        success_url: 'http://localhost:3000/success?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: 'http://localhost:3000/memberships',
        payment_method_types: ['card'],
        line_items: [{
          price: price.id,
          quantity: 1
        }],
        mode: 'subscription',
        subscription_data: {
          trial_period_days: 14
        },
        metadata: {
          membership_id: @membership.id,
          membership_title: @membership.title
        }
      }
    )
  end

  def stripe_customer?(user)
    customer_email_list = Stripe::Customer.list({ email: @user.email })
    customers_ids = customer_email_list.data
    customers_ids.any? { |customer| customer["id"] == @user.stripe_customer_id }
  end

  def update_stripe_customer(user)
    customer = Stripe::Customer.update(@user.stripe_customer_id, metadata: { selected_membership: @membership })
    user.update!(stripe_customer_id: customer.id)
    customer
  end
end
