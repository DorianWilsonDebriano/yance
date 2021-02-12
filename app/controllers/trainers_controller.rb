class TrainersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  def show
    authorize @trainer
    @reviews = @trainer.reviews
    @review = Review.new
    start_range = Time.zone.now.in_time_zone(Time.now.zone) - 30.minutes
    end_range = Time.zone.now.in_time_zone(Time.now.zone).advance(days: 30)
    @trainer_classes = @trainer.sports_classes
      .where(date_time: Range.new(start_range, end_range))
      .order(date_time: :asc)
  end

  def new
    @trainer = Trainer.new
    authorize @trainer
  end

  def create
    @trainer = Trainer.new(trainer_params)
    @trainer.user = current_user
    authorize @trainer
    if @trainer.save
      redirect_to trainer_path(@trainer), notice: "Your trainer profile has been created!"
    else
      render :new
    end
  end

  def edit
    authorize @trainer
  end

  def update
    authorize @trainer
    if @trainer.update(trainer_params)
      redirect_to trainer_path(@trainer), notice: "Your trainer profile has been updated!"
    else
      render :edit
    end
  end

  def destroy
    authorize @trainer
    redirect_to profile_path, notice: "Your trainer profile has been deleted."
  end

  private

  def trainer_params
    params.require(:trainer).permit(:bio, :city, :sport_category, :profile_photo, :time_line_photo)
  end

  def set_trainer
    @trainer = Trainer.find(params[:id])
    authorize @trainer
  end
end
