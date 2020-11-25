class SportsClassesController < ApplicationController
  before_action :set_sports_class, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sports_classes = policy_scope(SportsClass)
      # trainers = policy_scope(Trainer)
      # @sports_classes = Searchkick.search(params[:query], models:[sports_classes, trainers])
      @sports_classes = sports_classes.search(params[:query])
      # if @sports_classes.first.class == Trainer
      #   @sports_classes = @sports_classes.first.sports_classes
      # end
    else
      @sports_classes = policy_scope(SportsClass).order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @sportsclass = SportsClass.new
    authorize @sportsclass
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @sportsclass = SportsClass.new(sports_class_params)
    @sportsclass.trainer = @trainer
    if @sportsclass.save
      redirect_to sports_classes_path, notice: "Your class has been created"
    else
      render :new
    end
    authorize @sportsclass
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
    authorize @sportsclass
  end

  def sports_class_params
    params.require(:sports_class).permit(:title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language)
  end
end
