class CustomerPortalSessionsController < ApplicationController
  before_action :skip_authorization, only: [:create]
  def create
    return_url = Rails.env.development? ? "http://localhost:3000/settings" : "https://www.yancesport.com/settings"
    portal_session = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id,
      return_url: return_url
    })
    redirect_to portal_session.url
  end
end
