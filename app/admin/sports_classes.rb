ActiveAdmin.register SportsClass do
  includes :trainer
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  # trainers = Trainer.where(id: SportsClass.pluck(:trainer_id))
  #
  permit_params :title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language, :trainer_id, :room,
                class_booking_attributes: [:id, :user_id, :sports_class_id],
                trainer_attributes: [:id, :bio, :sport_category, :city, :user_id]

  filter :title, as: :select
  filter :date_time, as: :date_range
  filter :trainers, collection: -> { Trainer.pluck(:id) }
  filter :category, as: :select
  filter :difficulty_level, as: :select
  filter :sweat_level, as: :select
  filter :experience_level, as: :select
  filter :language, as: :select

  index do
    column "Sports Class" do |sports_class|
      link_to sports_class.title, admin_sports_class_path(sports_class)
    end
    column "Class Photo" do |sports_class|
      link_to image_tag(sports_class.photo), admin_sports_class_path(sports_class)
    end
    column "Trainer Name" do |sports_class|
      sports_class.trainer.user.first_name
    end
    column "Trainer ID" do |sports_class|
      sports_class.trainer.user.first_name
      link_to sports_class.trainer_id, admin_trainer_path(sports_class.trainer_id)
    end
    column "Description" do |sports_class|
      sports_class.description
    end
    column "Category" do |sports_class|
      sports_class.category
    end
    column "Streaming Room" do |sports_class|
      sports_class.room
    end
    column "Language" do |sports_class|
      sports_class.language
    end
    column "Date" do |sports_class|
      sports_class.date_time
    end
  end

  show title: :title do
      attributes_table do
        row :class_picture do
          image_tag sports_class.photo
        end
        row :title do
          sports_class.title
        end
        row :description do
          sports_class.description
        end
        row :Trainer_ID do
          link_to sports_class.trainer_id, admin_trainer_path(sports_class.trainer_id)
        end
        row :sports_class_created_on do
          sports_class.created_at
        end
        row :language do
          sports_class.language
        end
        row :difficulty_level do
          sports_class.difficulty_level
        end
        row :experience_level do
          sports_class.experience_level
        end
        # row :membership do
        #   user_membership = Membership.find(Subscription.where(user_id: Subscription.pluck(:user_id)).first.membership_id)
        #   link_to user_membership.title, admin_membership_path(user_membership)
        # end
        # row :class_bookings do
        #   user_bookings = SportsClass.find(user.class_bookings.pluck(:sports_class_id))
        #   ul do
        #     user_bookings.each do |sports_class|
        #       li link_to sports_class.title, admin_sports_class_path(sports_class)
        #     end
        #   end
        # end
        # row :Trainer_ID do
        #   link_to user.trainer_ids.join, admin_trainer_path(user.trainer_ids)
        # end
        # row :authorised_admin do
        #   user.admin
        # end
      end
      active_admin_comments
  end
end
