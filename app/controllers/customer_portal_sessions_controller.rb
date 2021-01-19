class CustomerPortalSessionsController < ApplicationController
  before_action :skip_authorization, only: [:create]
  def create
  portal_session = Stripe::BillingPortal::Session.create({
    customer: current_user.stripe_customer_id,
    #laura sample user id 'cus_Ia6uu8xXbZUSPw'
    return_url: 'https://yancesport.com/settings',
  })

  redirect_to portal_session.url
  end
end
