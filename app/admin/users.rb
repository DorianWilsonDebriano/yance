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
                :username,
                :first_name,
                :last_name,
                :bio,
                :language,
                :admin,
                subscription_attributes: [:id, :user_id, :membership_id, :credits],
                membership_attributes: [:id, :title, :credits, :price, :description],
                trainer_attributes: [:id, :bio, :sport_category, :city, :user_id]

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
    column "Trainer ID" do |user|
      link_to user.trainer_ids.join, admin_trainer_path(user.trainer_ids)
    end
    column "Lanuages" do |user|
      user.language
    end
    column "Admin" do |user|
      user.admin
    end
    column "Classes" do |user|
      user_classes = SportsClass.find(user.sports_class_ids)
      ul do
        user_classes.each do |sports_class|
          li link_to sports_class.title, admin_sports_class_path(sports_class)
        end
      end
    end
  end

  show title: :first_name do
    attributes_table do
      row :profile_picture do |ad|
        image_tag user.photo
      end
      row :first_name do
        user.first_name
      end
      row :last_name do
        user.last_name
      end
      row :user_created_on do |ad|
        user.created_at
      end
      row :bio do
        user.bio
      end
      row :encrypted_password do
        user.encrypted_password
      end
      row :languages do
        user.language
      end
      row :membership do
        user_membership = Membership.find(Subscription.where(user_id: Subscription.pluck(:user_id)).first.membership_id)
        link_to user_membership.title, admin_membership_path(user_membership)
      end
      row :Trainer_ID do
        link_to user.trainer_ids.join, admin_trainer_path(user.trainer_ids)
      end
      row :authorised_admin do
        user.admin
      end
    end
    active_admin_comments
  end
end

  # sidebar "Details", only: :show do
  #   attributes_table_for book do
  #     row :title
  #     row :author
  #     row :publisher
  #     row('Published?') { |b| status_tag b.published? }
  #   end
  # end
# end
