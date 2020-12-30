ActiveAdmin.register SportsClass do
  includes :trainer
  actions :all, except: :new
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
    column "ID" do |sports_class|
      link_to sports_class.id, admin_sports_class_path(sports_class)
    end
  end

  show title: :title do
      attributes_table do
        row :id do
          sports_class.id
        end
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
        row :sweat_level do
          sports_class.sweat_level
        end
        row :total_bookings do
          sports_class.class_bookings.count
        end
      end
      active_admin_comments
  end
end
