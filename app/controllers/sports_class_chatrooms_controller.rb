class SportsClassChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :enforce_tenancy, only: [:show]

  def index
    @sports_class_chatrooms = policy_scope(SportsClassChatroom).where(['date_time > ?', Time.now])
    @booked_sports_chatrooms = @sports_class_chatrooms.where(sports_class_id: current_user.all_booked_classes.pluck(:id))
    @sports_classes = SportsClass.find(@booked_sports_chatrooms.pluck(:sports_class_id))
  end

  def show
    @sports_class_chatroom = SportsClassChatroom.find(params[:id])
    @sports_class_message = SportsClassMessage.new
    @sports_class_chatrooms = policy_scope(SportsClassChatroom).where(['date_time > ?', Time.now])
    @booked_sports_chatrooms = @sports_class_chatrooms.where(sports_class_id: current_user.all_booked_classes.pluck(:id))
    authorize @sports_class_chatroom
  end

  def update
    authorize @sports_class_chatroom
    if @sports_class_chatroom.update(sports_class_chatroom_params)
      redirect_to sports_class_chatrooms_path, notice: "#{@sports_class_chatroom.name}'s information has been saved."
    else
      redirect_to profile_path, notice: "#{@sports_class_chatroom.name}'s information has not been saved."
    end
  end

  private

  def sports_class_chatroom_params
   params.require(:sports_class_chatroom).permit(:date_time, :name)
  end

  def enforce_tenancy
    @sports_class_chatrooms = policy_scope(SportsClassChatroom).where(['date_time > ?', Time.now])
    @booked_sports_chatrooms_ids = @sports_class_chatrooms.where(sports_class_id: current_user.all_booked_classes.pluck(:id)).ids
    @user_booked_chatrooms = @booked_sports_chatrooms_ids.map(&:to_s)
    @user_access_to_show = @user_booked_chatrooms.include?(params[:id])
    redirect_to sports_class_chatrooms_path, notice: t('controllers.sports_class_chatrooms.enforce_tenancy.flash.notice') unless @user_access_to_show
  end
end
