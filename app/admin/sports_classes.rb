ActiveAdmin.register SportsClass do
  # belongs_to :trainer
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


  index do
    column "Sports Class" do |sports_class|
      link_to sports_class.title, admin_sports_class_path(sports_class)
    end
    column "Trainer" do |sports_class|
      sports_class.trainer.user.first_name
      link_to sports_class.trainer.user.first_name, admin_trainer_sports_classes_path(trainer)
    end
  end
# column "Title" do |post|
#     link_to post.title, admin_post_path(post)
#   end
  # index as: :grid, columns: 3 do |sports_class|
  #   columns do
  #     row sports_class.title
  #     div class: "grid_container" do
  #       # span class: "image_container" do
  #       #   sports_class.title
  #       #   link_to image_tag(sports_class.photo), admin_sports_class_path(sports_class)
  #       # end
  #     end
  #   end
  # end
  # index do |sports_class|
  #   # attributes_table do
  #   #   row :id
  #   #   row :full_name
  #     # attributes_table_for sports_class do
  #   column do
  #     trainers.each {|trainer| trainer.id}

  #       # sports_class.each { |sports_class| sports_class.trainer }.compact
  #       # row :title
  #       # row :trainer
  #       # row :email
  #     end
  #   end
  end


  #Trainer.find(SportsClass.pluck(:trainer_id))
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language, :trainer_id, :room]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

# end
