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
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :sports_class_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
end


