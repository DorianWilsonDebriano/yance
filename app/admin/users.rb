ActiveAdmin.register User do
  permit_params :email, :username, :first_name, :last_name, :language, :bio, :admin

  actions :all, except: :new

  filter :first_name, as: :select
  filter :last_name, as: :select
  filter :trainers, collection: -> { Trainer.pluck(:id) }
  filter :email, as: :select
  filter :language, as: :select

  form do |f|
    f.inputs 'Details', class: "admin-form" do
      f.semantic_errors
      f.input :email, input_html: { style: 'width: 20%' }
      f.input :first_name, input_html: { style: 'width: 20%' }
      f.input :last_name, input_html: { style: 'width: 20%' }
      f.input :language, input_html: { style: 'width: 20%' }
      f.input :admin, as: :select, input_html: { style: 'width: 21.5%' }
      f.input :bio, input_html: { style: 'width: 20%' }
      f.input :photo, input_html: { style: 'width: 20%' }
      f.button :submit, class: 'btn class-sign-up-button sweet-alert', id:"sweet-alert-class"
    end
  end

  controller do
    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(permitted_params[:user])
        redirect_to admin_users_path, notice: "#{@user.first_name}'s information has been saved."
      else
        render :edit
      end
    end
  end

  index do
    column "First Name" do |user|
      link_to user.first_name, admin_user_path(user)
    end
    column "Last Name" do |user|
      link_to user.last_name, admin_user_path(user)
    end
    column "Photo" do |user|
      link_to image_tag(user.photo), admin_user_path(user)
    end
    column "Email" do |user|
      link_to user.email, admin_user_path(user)
    end
    column "Lanuages" do |user|
      user.language
    end
    column "Admin" do |user|
      user.admin
    end
    column "ID" do |user|
      link_to user.id, admin_user_path(user)
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
      row :id_trainer do
        link_to user.trainer_ids.join, admin_trainer_path(user.trainer_ids)
      end
      row :authorised_admin do
        user.admin
      end
    end
    active_admin_comments
  end
end
