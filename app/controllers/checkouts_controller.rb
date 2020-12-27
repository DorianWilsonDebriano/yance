class CheckoutsController < ApplicationController
  def new
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        subscription_data: {
            items: [{ plan: params[:plan] }],
        },
        customer: current_user.stripe_id,
        client_reference_id: current_user.id,
        success_url: create_checkout_url(session_id: '{CHECKOUT_SESSION_ID}'),
        cancel_url: root_url,
    )

    render json: { session_id: session.id }
  end
end
