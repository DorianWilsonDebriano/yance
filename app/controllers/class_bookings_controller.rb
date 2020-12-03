class ClassBookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @sportsclass = SportsClass.find(params[:sportsclass_id])
    @classbooking = ClassBooking.new
    authorize @classbooking
  end

  def create
    @sports_class = SportsClass.find(params[:sports_class_id])
    @classbooking = ClassBooking.new
    @classbooking.user = current_user
    @classbooking.sports_class = @sports_class
    @subscription = current_user.subscription
    @membership = current_user.subscription.membership if current_user.subscription != nil
    if @classbooking.save
      @subscription.update(credits: @subscription.credits - 1) if current_user.subscription != nil
      redirect_to sports_classes_path, notice: "Your class is successfully booked!"
    else
      redirect_to sports_classes_path, notice: "You have already booked this class"
    end
    authorize @classbooking
  end

  def destroy
    @classbooking = ClassBooking.find(params[:id])
    @membership = current_user.subscription.membership
    @subscription = current_user.subscription
    @classbooking.destroy
    @subscription.update(credits: @subscription.credits + 1)
    redirect_to sports_classes_path
    authorize @classbooking
  end
end
