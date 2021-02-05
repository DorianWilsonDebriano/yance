class SportsClassChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:show, :index]

  def show
    @sports_class_chatroom = SportsClassChatroom.find(params[:id])
    @sports_class_message = SportsClassMessage.new
    authorize @sports_class_chatroom
  end

  def index
    @sports_class_chatrooms = policy_scope(SportsClassChatroom).where(['date_time > ?', Time.now])
    # @sports_class_chatrooms = policy_scope(SportsClassChatroom)
    @sports_classes = SportsClass.find(@sports_class_chatrooms.pluck(:sports_class_id))
    # raise
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
     params.require(:sports_class_chatroom).permit(:date_time)
  end
end



