ActiveAdmin.register Membership do
  # has_many :subscriptions
  # has_many :users, through: :subscriptions

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :expiration_date, :credits, :price, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :expiration_date, :credits, :price, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
