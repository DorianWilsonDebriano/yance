class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    # @membership = Membership.find_by(title: params[:title])
    # @user = current_user
    # @subscription = Subscription.new
    # authorize @subscription
  end

  #when user hits choose, create method gets triggered, checks for params passed from
  #form and if params are valid then creates checkout session, if checkout session
  #is completed/successfull then we create a subscription on our database.

  def create
    @membership = Membership.find(params[:membership_id])
    @user = current_user
    @subscription = Subscription.new
    @subscription.user = current_user
    @subscription.membership = @membership
    authorize @subscription
    if @subscription.save
      customer = create_stripe_customer(@user)
      @session = create_checkout_session(customer, @user)
      session[:token] = @user.session_token
      render :checkout
    elsif
      @membership == current_user.membership
      redirect_to memberships_path, notice: "You are alredy subscribed to this membership"
    end
  end

  # def create
  #   @membership = Membership.find(params[:membership_id])
  #   @user = current_user
  #   @subscription = Subscription.new
  #   @subscription.user = current_user
  #   @subscription.membership = @membership
  #   authorize @subscription
  #   customer = create_stripe_customer(@user)
  #   @session = create_checkout_session(customer, @user)
  #   session[:token] = @user.session_token
  #   render :checkout
  #   if @subscription.save
  #     redirect_to root_path
  #   else
  #     @membership == current_user.membership
  #     redirect_to memberships_path, notice: "You are alredy subscribed to this membership"
  #   end
  # end

  # def create
  #   @user = current_user
  #   @membership = Membership.find(params[:membership_id])
  #   @customer = create_stripe_customer(@user)
  #   @session = create_checkout_session(@customer, @user)
  #   session[:token] = @user.session_token
  #   render :checkout
  #   if customer_subscription?
  #     @membership = Membership.find(params[:membership_id])
  #     @user = current_user
  #     @subscription = Subscription.new
  #     @subscription.user = current_user
  #     @subscription.membership = @membership
  #     authorize @subscription
  #   else
  #     @membership == current_user.membership
  #     redirect_to memberships_path, notice: "You are alredy subscribed to this membership"
  #   end
  # end

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
        selected_membership: current_user.membership
      }
    )
    user.update!(stripe_customer_id: customer.id)
    customer
  end

  def create_checkout_session(customer, user)
    price = Stripe::Price.list(lookup_keys: [@membership.title]).data.first

    @checkout_session = Stripe::Checkout::Session.create({
        customer: current_user.stripe_customer_id,
        success_url: 'http://localhost:3000/',
        cancel_url: 'http://localhost:3000/memberships',
        payment_method_types: ['card'],
        line_items: [{
          price: price.id,
          quantity: 1
        }],
        mode: 'subscription',
        subscription_data: {
          trial_period_days: 14
        }
      })
    # session = event.data.object
    # @subscription = Subscription.find_by(user_id: current_user.id)
    # @subscription.update!(stripe_id: session.checkout.session.subscription)
  end

  # def customer_subscription?
  #   customer = Stripe::Customer.retrieve(
  #   subscription.customer
  # )
  #   subscription = Stripe::Subscription.retrieve(
  #   subscription.customer
  # )
  #   !customer.first.empty?
  # end
end


