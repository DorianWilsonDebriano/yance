class TrainersController < ApplicationController
before_action :authenticate_user!

  def show
    @trainer = Trainer.find(params[:id])
    authorize @trainer
  end

  def new
    @trainer = Trainer.new
    authorize @trainer
  end

  def create
    @trainer = Trainer.new(trainer_params)
    @trainer.user = current_user
    if @trainer.save!
      redirect_to trainer_path(@trainer)
    else
      render :new
    end
    authorize @trainer
  end

  private

  def trainer_params
    params.require(:trainer).permit(:bio, :city, :sport_category, :profile_photo, :time_line_photo)
  end

end
