require "date"

class SportsClassesController < ApplicationController
  before_action :set_sports_class, only: [:show, :edit, :update, :destroy]

  def index
    @sports_classes = policy_scope(SportsClass).order(date_time: :asc).includes(:trainer)
    handle_search
    handle_date_search
    handle_filters

    @classbooking = ClassBooking.new
    @classbookings = policy_scope(ClassBooking).where(user: current_user)
  end

  def show
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @trainer.user = current_user
    @sportsclass = SportsClass.new
    authorize @sportsclass
    # authorize @trainer, policy_class: SportsClassPolicy
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @sportsclass = SportsClass.new(sports_class_params)
    @sportsclass.trainer = @trainer
    authorize @sportsclass
    if @sportsclass.save
      redirect_to sports_classes_path, notice: "Your class has been created"
    else
      render :new
    end
  end

  def edit
    authorize @sportsclass
  end

  def update
    authorize @sportsclass
    if @sportsclass.update(sports_class_params)
      redirect_to sports_classes_path, notice: "Your class has been updated"
    else
      render :edit
    end
  end

  def destroy
    # authorize @sportsclass
    @sportsclass.destroy
    redirect_to sports_classes_path, notice: "#{@sportsclass.title} has been deleted"
  end

  private

  def set_sports_class
    @sportsclass = SportsClass.find(params[:id])
    authorize @sportsclass
  end

  def sports_class_params
    params.require(:sports_class).permit(:title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language, :photo)
  end

  def handle_search
    if params[:query].present?
      @sports_classes = @sports_classes.search(params[:query])
    end
  end

  def handle_date_search
    if params[:starts_at].present?
      if params[:starts_at].include?(" to ")
        starts_at, ends_at = *params[:starts_at].split(" to ")
        starts_at = starts_at.in_time_zone("CET")
        ends_at = ends_at.in_time_zone("CET")
        @sports_classes = @sports_classes.where(date_time: Range.new(starts_at, ends_at))
      else
        starts_at = params[:starts_at].in_time_zone("CET")
        @sports_classes = @sports_classes.where(date_time: Range.new(starts_at, starts_at.advance(days: 1)))
      end

    end
  end

  def handle_filters
    if params.dig(:sports_class, :category).present?
      @sports_classes = @sports_classes.where(category: params[:sports_class][:category])
    end

    if params.dig(:sports_class, :difficulty_level).present?
      @sports_classes = @sports_classes.where(difficulty_level: params[:sports_class][:difficulty_level])
    end

    if params.dig(:sports_class, :experience_level).present?
      @sports_classes = @sports_classes.where(experience_level: params[:sports_class][:experience_level])
    end

    if params.dig(:sports_class, :sweat_level).present?
      @sports_classes = @sports_classes.where(sweat_level: params[:sports_class][:sweat_level])
    end

    if params.dig(:sports_class, :duration).present?
      @sports_classes = @sports_classes.where(duration: params[:sports_class][:duration])
    end
  end
end





























