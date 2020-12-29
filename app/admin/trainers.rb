ActiveAdmin.register Trainer do
  includes :user
  permit_params :bio, :sport_category, :city, :user_id
  actions :all, except: :new

  # or
  #
  # permit_params do
  #   permitted = [:bio, :sport_category, :city, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :id, as: :select
  filter :city, as: :select
  filter :sport_category, as: :select

  index do
    column "First Name" do |trainer|
      link_to User.find(trainer.user_id).first_name, admin_trainer_path(trainer.id)
    end
    column "Last Name" do |trainer|
      link_to User.find(trainer.user_id).last_name, admin_trainer_path(trainer.id)
    end
    column "Photo" do |trainer|
      link_to image_tag(User.find(trainer.user_id).photo), admin_trainer_path(trainer.id)
    end
    column "Bio" do |trainer|
      trainer.bio
    end
    column "ID" do |trainer|
      link_to trainer.id, admin_trainer_path(trainer.id)
    end
    column "Sport Category" do |trainer|
      trainer.sport_category
    end
    column "City" do |trainer|
      trainer.city
    end
    actions
  end

  show title: :id do
    attributes_table do
      row :profile_picture do
        image_tag trainer.user.photo
      end
      row :first_name do
        trainer.user.first_name
      end
      row :last_name do
        trainer.user.last_name
      end
      row :bio do
        trainer.bio
      end
      row :sport_category do
        trainer.sport_category
      end
      row :city do
        trainer.city
      end
      row :trainer_created_on do
        trainer.created_at
      end
      row :id_user do
        link_to trainer.user_id, admin_user_path(trainer.user_id)
      end
    end
    active_admin_comments
  end
end
