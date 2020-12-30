class ClassBookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @sportsclass = SportsClass.find(params[:sportsclass_id])
    @classbooking = ClassBooking.new
    authorize @classbooking
  end

  def create
    @sports_class = SportsClass.find(params[:sports_class_id])
    @classbooking = ClassBooking.new(class_booking_params)
    @classbooking.user = current_user
    @classbooking.sports_class = @sports_class
    @subscription = current_user.subscription
    @membership = current_user.subscription.membership if current_user.subscription != nil
    if current_user.subscription.nil?
      if check_password
        @classbooking.save
        redirect_to sports_classes_path, notice: "Your class is successfully booked!"
      else
        redirect_to sports_classes_path, notice: "wrong password for this class"
      end
    else
      if @classbooking.save
        redirect_to sports_classes_path, notice: "Your class is successfully booked!"
      else
        redirect_to sports_classes_path, notice: "You have already booked this class"
      end
    end
    authorize @classbooking
  end

  def destroy
    @classbooking = ClassBooking.find(params[:id])
    @membership = current_user.subscription.membership unless current_user.subscription.nil?
    @subscription = current_user.subscription
    @classbooking.destroy
    redirect_to sports_classes_path
    authorize @classbooking
  end

  private

  def class_booking_params
    params.require(:class_booking).permit(:password, user_attributes: [:id], sports_class_attributes: [:id])
  end

  def check_password
    @classbooking.password == @sports_class.password
  end
end
