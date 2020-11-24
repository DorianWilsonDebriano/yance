class TrainersController < ApplicationController
before_action :authenticate_user!

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    @trainer.user = current_user
    if @trainer.save!
      redirect_to trainer_path(@trainer)
    else
      render :new
    end
  end

  private

  def trainer_params
    params.require(:trainer).permit(:bio, :city, :sport_category)
  end
end
