class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @membership = Membership.find(params[:membership_id])
    @user = current_user
    @subscription = Subscription.new
    authorize @subscription
  end

  def create
    @membership = Membership.find(params[:membership_id])
    @subscription.user = current_user
    @subscription = Subscription.new
    authorize @subscription
    if @subscription.save
      @membership.expiration_date = Date.now + 30.days
      redirect_to sports_classes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
