class ChatroomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @chatrooms = policy_scope(Chatroom)
    @user = current_user
    authorize @chatrooms
  end

  def show
    if params[:id] == Chatroom.second.id.to_s
      enforce_tenancy_trainers
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
    else
      @chatroom = Chatroom.find(params[:id])
      @message = Message.new
    end
    authorize @chatroom
  end

  private

  def current_user_trainer?
    !current_user.trainer_ids.empty?
  end

  def enforce_tenancy_trainers
    redirect_to chatrooms_path, notice: t('controllers.chatrooms.enforce_tenancy_trainers.flash.notice') unless current_user_trainer?
  end
end
