require "date"
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class SportsClassesController < ApplicationController
  before_action :set_sports_class, only: [:show, :edit, :update, :duplicate, :destroy]

  def index
    start_range = Time.zone.now.in_time_zone(Time.now.zone) - 30.minutes
    end_range = Time.zone.now.in_time_zone(Time.now.zone).advance(days: 90)
    @sports_classes = policy_scope(SportsClass)
      .where(date_time: Range.new(start_range, end_range))
      .order(date_time: :asc)
      .includes(trainer: { user: { photo_attachment: :blob } }, photo_attachment: :blob)
    handle_search
    handle_date_search
    handle_filters
    handle_filter_cards
    @classbooking = ClassBooking.new
    @classbookings = current_user&.class_bookings&.includes(user: [:subscription, :membership]) || []
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
      room = create_room(@sportsclass)
      @sportsclass.update(room: JSON.parse(room.body)["name"])
      redirect_to profile_path, notice: "#{@sportsclass.title} has been created!"
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
      redirect_to profile_path, notice: "#{@sportsclass.title}'s information has been saved."
    else
      render :edit
    end
  end

  def duplicate
    @dup_sportsclass = @sportsclass.deep_clone include: [:photo_attachment, :photo_blob]
    @trainer = @dup_sportsclass.trainer
    authorize @dup_sportsclass
    if @dup_sportsclass.save
      room = create_room(@dup_sportsclass)
      @dup_sportsclass.update(room: JSON.parse(room.body)["name"])
      redirect_to edit_sports_class_path(@dup_sportsclass)
    end
  end

  def destroy
    authorize @sportsclass
    @sportsclass.destroy
    redirect_to profile_path, notice: "Your class has been deleted."
  end

  private

  def create_room(sportsclass)
    url = URI("https://api.daily.co/v1/rooms")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'Bearer ' + ENV["DAILY"]
    request.body = "{\"properties\":{\"exp\":\"#{sportsclass.date_time.to_i + 86400}\",\"enable_chat\":true},\"name\":\"#{sportsclass.id}\",\"privacy\":\"public\"}"

    response = http.request(request)
    return response
  end

  def set_sports_class
    @sportsclass = SportsClass.find(params[:id])
    authorize @sportsclass
  end

  def sports_class_params
    params.require(:sports_class).permit(:title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language, :password, :photo)
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
        starts_at = starts_at.in_time_zone(Time.now.zone)
        ends_at = ends_at.in_time_zone(Time.now.zone).advance(days: 1)
        @sports_classes = @sports_classes.where(date_time: Range.new(starts_at, ends_at))
      else
        starts_at = params[:starts_at].in_time_zone(Time.now.zone)
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

  def handle_filter_cards
    if params[:category].present?
      start_range = Time.zone.now.in_time_zone(Time.now.zone) - 30.minutes
      end_range = Time.zone.now.in_time_zone(Time.now.zone).advance(days: 90)
      @sports_classes = SportsClass
        .where(category: params[:category], date_time: Range.new(start_range, end_range))
        .order(date_time: :asc)
    end
  end
end
