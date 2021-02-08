class SportsClassChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:show, :index]

  def show
    @sports_class_chatroom = SportsClassChatroom.find(params[:id])
    @sports_class_message = SportsClassMessage.new
    authorize @sports_class_chatroom
  end

  def index
    @sports_class_chatrooms = policy_scope(SportsClassChatroom).where(['date_time > ?', Time.now])
    @booked_sports_chatrooms = @sports_class_chatrooms.where(sports_class_id: current_user.all_booked_classes.pluck(:id))
    @sports_classes = SportsClass.find(@booked_sports_chatrooms.pluck(:sports_class_id))
    # @sports_classes = SportsClass.find(@sports_class_chatrooms.pluck(:sports_class_id))
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



#   def index
#     @chatrooms = policy_scope(Chatroom)
#     @user = current_user
#     @user_bookings = @user.all_booked_classes.pluck(:title)
#     @chatroom_names = @chatrooms.pluck(:name)
#     @user_class_chatrooms = @user_bookings & @chatroom_names
#     class_chatrooms
#     authorize @chatrooms
#   end

#   def show
#     @chatroom = Chatroom.find(params[:id])
#     @message = Message.new
#     authorize @chatroom
#   end

# #   def create
# #     @chatroom = Chatroom.new(chatroom_params)
# #     if @chatroom.save
# #       redirect_to chatrooms_path
# #     else
# #       render '/profile'
# #     end
# #   end

#   private

#   def class_chatrooms
#     if !@user_class_chatrooms.empty?
#       @chatrooms_all = Chatroom.where(name: @user_class_chatrooms)
#     end
#   end
