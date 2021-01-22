class SportsClassChatroomsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:show, :index]

  def show
    @sports_class_chatroom = SportsClassChatroom.find(params[:id])
    @sports_class_message = SportsClassMessage.new
    authorize @sports_class_chatroom
  end

  def index
    # @sports_classes = SportsClass.find(SportsClassChatroom.pluck(:sports_class_id))
    # @sports_class_times = @sports_classes.pluck(:date_time).each do |sc|
      @sports_class_chatrooms = policy_scope(SportsClassChatroom)
        .where(['date_time > ?', Time.now])
    # end
  end
end

# classes = SportsClass.find(SportsClassChatroom.pluck(:sports_class_id))

# classes.each {|c| p c.date_time < Time.now}



#  start_range = Time.zone.now.in_time_zone(Time.now.zone) - 30.minutes
#     end_range = Time.zone.now.in_time_zone(Time.now.zone).advance(days: 90)
#     @sports_class_chatrooms = policy_scope(SportsClassChatroom)
#       .where(['created_at < ?', Time.now])
#       .order(date_time: :asc)
#       .includes(trainer: { user: { photo_attachment: :blob } }, photo_attachment: :blob)


# sports_class_chatrooms.where(['created_at > ?', Time.now])
# Time.now > @sports_classes.last.date_time


 # @sports_class_times.first < Time.now
