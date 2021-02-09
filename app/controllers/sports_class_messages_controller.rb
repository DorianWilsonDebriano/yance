class SportsClassMessagesController < ApplicationController
  after_action :verify_authorized, except: [:create]
  skip_before_action :verify_authenticity_token
  def create
    @sports_class_chatroom = SportsClassChatroom.find(params[:sports_class_chatroom_id])
    @sports_class_message = SportsClassMessage.new(sports_class_message_params)
    @sports_class_message.sports_class_chatroom = @sports_class_chatroom
    @sports_class_message.user = current_user
    if @sports_class_message.save
      SportsClassChatroomChannel.broadcast_to(
        @sports_class_chatroom,
        render_to_string(partial: "sports_class_message", locals: { sports_class_message: @sports_class_message })
      )

      redirect_to sports_class_chatroom_path(@sports_class_chatroom, anchor: "sports_class_message-#{@sports_class_message.id}")
    else
      render "sports_class_chatrooms/show"
    end
  end

  private

  def sports_class_message_params
    params.require(:sports_class_message).permit(:content, :name)
  end
end




