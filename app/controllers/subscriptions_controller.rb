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
    @subscription = Subscription.new
    @subscription.user = current_user
    @subscription.membership = @membership
    @subscription.credits = @membership.credits
    authorize @subscription
    if @subscription.save
      redirect_to sports_classes_path
    else
      redirect_to sports_classes_path, notice: "You have already subscribed to the #{@membership.title} membership"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
