class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @membership = Membership.find(params[:membership_id])
    @user = current_user
    @subscription = Subscription.new
    authorize @subscription
  end

  def create
    @user = current_user
    @membership = Membership.find(params[:membership_id])
    @subscription = Subscription.new
    @subscription.user = current_user
    @subscription.membership = @membership
    # @subscription.credits = @membership.credits
    authorize @subscription
    if @subscription.valid?
      customer = create_stripe_customer(@user)
      @session = create_checkout_session(customer, @user)
      @subscription.save!
      session[:token] = @user.session_token
      render :checkout
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def create_stripe_customer(user)
    customer = Stripe::Customer.create(
      email: current_user.email,
      metadata: {
        selected_plan: current_user.membership
      }
    )
    user.update!(stripe_customer_id: customer.id)
    customer
  end

  def create_checkout_session(customer, user)
    price = Stripe::Price.list(lookup_keys: [user.plan]).data.first

    Stripe::Checkout::Session.create({
      customer: customer.id,
      success_url: 'http://localhost:3000/success',
      cancel_url: 'http://localhost:3000/cancel',
      payment_method_types: ['card'],
      line_items: [{
        price: price.id,
        quantity: 1,
      }],
      mode: 'subscription',
    })
  end
end
