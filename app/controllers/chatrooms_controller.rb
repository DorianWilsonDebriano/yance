class ChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:show, :index]
  def index
    @chatrooms = policy_scope(Chatroom)
    authorize @chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
