ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username

  actions :all, except: :new

  filter :first_name, as: :select
  filter :last_name, as: :select
  filter :trainers, collection: -> { Trainer.pluck(:id) }
  filter :email, as: :select
  filter :language, as: :select

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
    actions
  end

  show title: :first_name do
    attributes_table do
      row :profile_picture do
        image_tag user.photo
      end
      row :first_name do
        user.first_name
      end
      row :last_name do
        user.last_name
      end
      row :email do
        user.email
      end
      row :user_created_on do
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
      row :class_bookings do
        user_bookings = SportsClass.find(user.class_bookings.pluck(:sports_class_id))
        ul do
          user_bookings.each do |sports_class|
            li link_to sports_class.title, admin_sports_class_path(sports_class)
          end
        end
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
