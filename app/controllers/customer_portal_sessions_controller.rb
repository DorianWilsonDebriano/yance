class CustomerPortalSessionsController < ApplicationController
  before_action :skip_authorization, only: [:create]
  def create
  portal_session = Stripe::BillingPortal::Session.create({
    customer: 'cus_Ia6uu8xXbZUSPw',
    return_url: 'http://localhost:3000/settings',
  })

  redirect_to portal_session.url
  end
end
