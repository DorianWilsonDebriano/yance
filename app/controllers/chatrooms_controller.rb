class ChatroomsController < ApplicationController
  after_action :verify_authorized, except: [:show]
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
