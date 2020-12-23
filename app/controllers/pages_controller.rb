class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

  end

  def search
  end

  def profile
    @user = current_user
    handle_class_bookings
    handle_created_classes
  end

  private

  def handle_class_bookings
    start_range = Time.zone.now.in_time_zone(Time.now.zone)
    end_range = Time.zone.now.in_time_zone(Time.now.zone).advance(days: 30)
    @user_bookings = SportsClass
      .where(id: current_user.class_bookings.pluck(:sports_class_id))
      .where(date_time: Range.new(start_range, end_range))
      .order(date_time: :asc)
  end

  def handle_created_classes
    start_range = Time.zone.now.in_time_zone(Time.now.zone)
    end_range = Time.zone.now.in_time_zone(Time.now.zone).advance(days: 30)
    @user_sports_classes = SportsClass
      .where(id: current_user.sports_classes.pluck(:id))
      .where(date_time: Range.new(start_range, end_range))
      .order(date_time: :asc)
  end
end
