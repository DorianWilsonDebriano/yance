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
    @membership = current_user.subscription.membership
    if @classbooking.save
      @membership.update(credits: @membership.credits - 1)
      redirect_to sports_classes_path, notice: "You booked your class"
    else
      redirect_to sports_classes_path, notice: "You have already booked this class"
    end
    authorize @classbooking
  end

  def destroy
    @classbooking = ClassBooking.find(params[:id])
    @membership = current_user.subscription.membership
    @classbooking.destroy
    @membership.update(credits: @membership.credits + 1)
    redirect_to sports_classes_path
    authorize @classbooking
  end
end
