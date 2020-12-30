ActiveAdmin.register SportsClass do
  includes :trainer
  actions :all, except: :new

  permit_params :title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language, :trainer_id, :room, class_booking_attributes: [:id, :user_id, :sports_class_id], trainer_attributes: [:id, :bio, :sport_category, :city, :user_id]

  filter :title, as: :select
  filter :date_time, as: :date_range
  filter :trainers, collection: -> { Trainer.pluck(:id) }
  filter :category, as: :select
  filter :difficulty_level, as: :select
  filter :sweat_level, as: :select
  filter :experience_level, as: :select
  filter :language, as: :select

  form do |f|
    f.inputs 'Details', class: "admin-form" do
      f.input :title, input_html: { style: 'width: 18.5%' }
      f.input :trainer_id, as: :select, collection: Trainer.pluck(:id), input_html: { style: 'width: 20%' }
      f.input :category, as: :select, collection: SportsClass.categories, input_html: { style: 'width: 20%' }
      f.input :sweat_level, as: :select, collection: SportsClass.sweat_level, input_html: { style: 'width: 20%' }
      f.input :difficulty_level, as: :select, collection: SportsClass.difficulty_level, input_html: { style: 'width: 20%' }
      f.input :experience_level, as: :select, collection: SportsClass.experience_level, input_html: { style: 'width: 20%' }
      f.input :duration, input_html: { type: 'number', style: 'width: 18.5%' }
      f.input :language, input_html: { style: 'width: 18.5%' }
      f.input :description, input_html: { style: 'width: 18.5%' }
      f.input :room, as: :select, collection: SportsClass.pluck(:room), input_html: { style: 'width: 20%' }
      f.input :photo, input_html: { style: 'width: 20%' }
      f.button :submit, class: 'btn class-sign-up-button sweet-alert', id:"sweet-alert-class"
    end
  end

  controller do
    def edit
      @sports_class = SportsClass.find(params[:id])
    end

    def update
      @sports_class = SportsClass.find(params[:id])
      if @sports_class.update(permitted_params[:sports_class])
        redirect_to admin_sports_classes_path, notice: "#{@sports_class.title}'s information has been saved."
      else
        render :edit
      end
    end
  end

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
    actions
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
      row :duration do
        sports_class.duration
      end
      row :total_bookings do
        sports_class.class_bookings.count
      end
    end
    active_admin_comments
  end
end
