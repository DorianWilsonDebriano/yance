ActiveAdmin.register ClassBooking do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :sports_class_id,
                sports_class_attributes: [:id, :title, :description, :date_time, :duration, :category, :difficulty_level, :sweat_level, :experience_level, :equipment, :language, :trainer_id, :room]

  show do |class_booking|
    attributes_table do
      row :id
      row :full_name
      attributes_table_for class_booking.user do
        row :id
        row :first_name
        row :email
      end
    end
  end

  index do
    column "All Bookings" do
      ClassBooking.all
    end

    column "Name" do |class_booking|
      link_to class_booking.user.first_name, admin_user_path(class_booking)
    end
    # column "Last Name" do |class_booking|
    #   link_to class_booking.last_name, admin_user_path(class_booking)
    # end
    # column "Email" do |class_booking|
    #   link_to class_booking.email, admin_user_path(class_booking)
    # end
    # column "Photo" do |class_booking|
    #   link_to image_tag(class_booking.photo), admin_user_path(class_booking)
    # end
    # column "Trainer ID" do |class_booking|
    #   link_to class_booking.trainer_ids.join, admin_trainer_path(class_booking.trainer_ids)
    # end
    # column "Lanuages" do |class_booking|
    #   class_booking.language
    # end
    # column "Admin" do |class_booking|
    #   class_booking.admin
    # end
    # column "Classes" do |class_booking|
    #   user_classes = SportsClass.find(class_booking.sports_class_ids)
    #   ul do
    #     user_classes.each do |sports_class|
    #       li link_to sports_class.title, admin_sports_class_path(sports_class)
    #     end
    #   end
    # end
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :sports_class_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
end


