ActiveAdmin.register Membership do
  actions :all, except: :new

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
