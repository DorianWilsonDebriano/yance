ActiveAdmin.register User do
  # has_one :subscription
  # has_one :membership, through: :subscription
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email,
                :encrypted_password,
                :reset_password_token,
                :reset_password_sent_at,
                :remember_created_at,
                :username, :first_name,
                :last_name,
                :bio,
                :language,
                :admin,
                subscription_attributes: [:id, :user_id, :membership_id, :credits],
                membership_attributes: [:id, :title, :credits, :price, :description],
                trainer_attributes: [:id, :bio, :sport_category, :city, :user_id]


  # index do
  #   selectable_column
  #   column :id
  #   column :email
  #   column :first_name
  #   column :last_name
  #   column :encrypted_password
  #   column :created_at
  #   column :trainer_ids
  #   column :admin
  #   actions
  # end

  index do
    column "Name" do |user|
      link_to user.first_name, admin_user_path(user)
    end
    column "Last Name" do |user|
      link_to user.last_name, admin_user_path(user)
    end
    column "Email" do |user|
      link_to user.email, admin_user_path(user)
    end
    column "Photo" do |user|
      link_to image_tag(user.photo), admin_user_path(user)
    end
    column "Trainer" do |user|
      # user.trainer_ids
      link_to user.trainer_ids, admin_trainer_path(user.trainer_ids)
    end
  end
end
