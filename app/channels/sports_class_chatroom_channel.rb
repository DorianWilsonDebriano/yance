class SportsClassChatroomChannel < ApplicationCable::Channel
  def subscribed
    sports_class_chatroom = SportsClassChatroom.find(params[:id])
    stream_for sports_class_chatroom
  end

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
