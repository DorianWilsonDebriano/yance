require "date"

class SportsClassesController < ApplicationController
  before_action :set_sports_class, only: [:show, :edit, :update, :destroy]

  def index
    @sports_classes = policy_scope(SportsClass).order(created_at: :desc)
    if params[:query].present?
      @sports_classes = @sports_classes.search(params[:query])
    end
    if params[:starts_at].present?
      @sports_classes = @sports_classes.filter do |sports_class|
        time_query = params[:starts_at].split(' ')
        range_one = time_query.first
        range_two = time_query.last
        sports_class.date_time.between?(range_one, range_two)
      end
    else
      # @sports_classes = SportsClass.all
    end

    @classbooking = ClassBooking.new
    @classbookings = policy_scope(ClassBooking).where(user: current_user)
  end

  def show
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @sportsclass = SportsClass.new
    authorize @trainer, policy_class: SportsClassPolicy
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @sportsclass = SportsClass.new(sports_class_params)
    @sportsclass.trainer = @trainer
    authorize @trainer, policy_class: SportsClassPolicy
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
end
