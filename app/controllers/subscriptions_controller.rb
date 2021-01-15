class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @membership = Membership.find_by(title: params[:title])
    @user = current_user
    @subscription = Subscription.new
    authorize @subscription
  end

  # def create
  #   @membership = Membership.find(params[:membership_id])
  #   @user = current_user
  #   @subscription = Subscription.new
  #   @subscription.user = current_user
  #   @subscription.membership = @membership
  #   authorize @subscription
  #   if @subscription.save
  #     customer = create_stripe_customer(@user)
  #     @session = create_checkout_session(customer, @user)
  #     session[:token] = @user.session_token
  #     render :checkout
  #   elsif
  #     @membership == current_user.membership
  #     redirect_to memberships_path, notice: "You are alredy subscribed to this membership"
  #   end
  # end

  # def create
  #   skip_authorization
  #   @membership = Membership.find(params[:membership_id])
  #   @user = current_user
  #   #if the email of the user is already on the stripe database then update the existing customer
  #   #define a function that returns true if the email adress of the customer is already on stripe
  #   #if true then create stripe customer
  #   #elseif call a method to update existing customer on stripe
  #   if !@membership.nil?
  #     customer = create_stripe_customer(@user)
  #     @session = create_checkout_session(customer, @user)
  #     session[:token] = @user.session_token
  #     render :checkout
  #   elsif
  #     @membership == current_user.membership
  #     redirect_to memberships_path, notice: "You are alredy subscribed to this membership"
  #   end
  # end

  def create
      skip_authorization
      @membership = Membership.find(params[:membership_id])
      @user = current_user
      #if the email of the user is already on the stripe database then update the existing customer
      #define a function that returns true if the email adress of the customer is already on stripe
      if is_stripe_customer?(@user)
        #if true call a method to update existing customer on stripe
        customer = update_stripe_customer(@user)
        @session = create_checkout_session(customer, @user)
        session[:token] = @user.session_token
        render :checkout
      elsif !@membership.nil?
        customer = create_stripe_customer(@user)
        @session = create_checkout_session(customer, @user)
        session[:token] = @user.session_token
        render :checkout
      elsif
        @membership == current_user.membership
        redirect_to memberships_path, notice: "You are alredy subscribed to this membership"
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
        },
        metadata: {
          membership_id: @membership.id
        }
      })
  end

  def is_stripe_customer?(user)
    !Stripe::Customer.list({ email: @user.email }).empty?
    # customer = Stripe::Customer.retrieve(@user.stripe_customer_id)
    # customer.email == @user.email
  end

  def update_stripe_customer(user)
    customer = Stripe::Customer.update(@user.stripe_customer_id,
      metadata: {
        selected_membership: @membership
      }
    )
    user.update!(stripe_customer_id: customer.id)
    customer
  end
end


