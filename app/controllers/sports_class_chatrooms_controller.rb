class SportsClassChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:show, :index]

  def show
    @sports_class_chatroom = SportsClassChatroom.find(params[:id])
    @sports_class_message = SportsClassMessage.new
    authorize @sports_class_chatroom
  end

  def index
    @sports_classs_chatrooms = policy_scope(SportsClassChatroom)
  end

  # def show
  #   @sports_class_chatroom = SportsClassChatroom.find(params[:id])

  #   # /trainers/:trainer_id/sports_classes/:sports_class_id/sports_class_chatrooms/:id(.:format)
  # end
end
