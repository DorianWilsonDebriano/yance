ActiveAdmin.register Subscription do
  # belongs_to :user
  # belongs_to :membership
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :membership_id, :credits
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :membership_id, :credits]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column :id
    column :user_id
    column :membership_id
    column :created_at
    # column :subscription
    column :admin
    # column "User" do |subscription|
    #   User.find(subscription.user_id)
    #   # subscription.user_id.map { |subscription| subscription }.compact
    # end
    actions
  end


end
