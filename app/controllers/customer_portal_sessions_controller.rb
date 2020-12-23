class CustomerPortalSessionsController < ApplicationController

  def create
  portal_session = Stripe::BillingPortal::Session.create({
    customer: current_user.id,
    return_url: 'http://localhost:3000/settings',
  })

  redirect_to portal_session.url
  end
end
