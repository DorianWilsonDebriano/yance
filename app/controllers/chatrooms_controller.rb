class ChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:show, :index]
  def index
    @chatrooms = policy_scope(Chatroom)
    @user = current_user
    @user_bookings = @user.all_booked_classes.pluck(:title)
    @chatroom_names = @chatrooms.pluck(:name)
    @user_chatrooms = @user_bookings & @chatroom_names
    class_chatrooms
    authorize @chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

#   def create
#     @chatroom = Chatroom.new(chatroom_params)
#     if @chatroom.save
#       redirect_to chatrooms_path
#     else
#       render '/profile'
#     end
#   end

  private

  def class_chatrooms
    if !@user_chatrooms.empty?
      @chatrooms_all = Chatroom.where(name: @user_chatrooms)
    end
  end

#   def chatroom_params
#     params.require(:chatroom).permit(:name)
#   end
end



