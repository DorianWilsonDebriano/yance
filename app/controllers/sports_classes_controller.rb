class SportsClassesController < ApplicationController
  before_action :set_sports_class

  def index
  end

  def show
  end

  def new
    @sportsclass = SportsClass.new
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @sportsclass = SportsClass.new(sports_class_params)
    @sportsclass.trainer = @trainer
    if @sportsclass.save
      redirect_to @sportsclass, notice: "Your class has been created"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_sports_class
    @sportsclass = SportsClass.find(params[:id])
  end

  def sports_class_params
    params.require(:sports_class).permit(:title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language)
  end
end
