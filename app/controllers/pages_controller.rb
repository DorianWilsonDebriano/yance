class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :home, :trainer_info, :pricing, :policy]

  def index
  end

  def home
  end

  def search
  end

  def profile
    @user = current_user
    @user_bookings = current_user.class_bookings
    @user_sports_classes = current_user.sports_classes.order(date_time: :asc)
  end

  def trainer_info
  end

  def pricing
  end

  def policy
  end
end
