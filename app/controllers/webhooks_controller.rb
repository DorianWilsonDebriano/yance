class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :skip_authorization

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials.stripe[:webhook_secret]
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      @user = User.find_by(stripe_customer_id: session.customer)
      @subscription = Subscription.new(user_id: @user.id)
      @subscription.stripe_id = session.subscription
      subscription_status = Stripe::Subscription.retrieve(session.subscription).status
      @subscription.membership_id = session.metadata.membership_id
      @subscription.update(subscription_status: subscription_status)
    when 'customer.subscription.updated'
      subscription = event.data.object
      invoice = Stripe::Invoice.retrieve(subscription.latest_invoice)
      if invoice.billing_reason == "subscription_create"
        puts "success"
      else
        @user = User.find_by(stripe_customer_id: subscription.customer)
        user_subscription = Subscription.find_by(user_id: @user.id)
        user_subscription.update(subscription_status: subscription.status)
      end
    when 'customer.subscription.deleted'
      subscription = event.data.object
      @user = User.find_by(stripe_customer_id: subscription.customer)
      user_subscription = Subscription.find_by(user_id: @user.id)
      user_subscription.delete
    end
    render json: { message: 'success' }
  end
end
