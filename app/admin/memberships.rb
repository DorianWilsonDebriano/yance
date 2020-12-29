ActiveAdmin.register Membership do
  actions :all, except: :new
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
  filter :title, as: :select
  filter :price, as: :select
  filter :credits, as: :select

  index do
    column "Title" do |membership|
      link_to membership.title, admin_membership_path(membership)
    end
    column "Description" do |membership|
      membership.description
    end
    column "Price" do |membership|
      membership.price
    end
    column "Expiration Date" do |membership|
      membership.expiration_date
    end
  end


end
