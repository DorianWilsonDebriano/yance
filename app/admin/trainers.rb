ActiveAdmin.register Trainer do
  # belongs_to :user
  includes :user
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :bio, :sport_category, :city, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:bio, :sport_category, :city, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # index do
  #   selectable_column
  #   column :id
  #   column :email
  #   column :first_name
  #   column :last_name
  #   column :encrypted_password
  #   column :created_at
  #   column :subscription
  #   column :admin
  #   actions
  # end

end
