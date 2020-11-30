class MembershipsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @memberships = policy_scope(Membership)
    authorize @memberships
  end

  def show
    @membership = Membership.find(params[:membership_id])
    authorize @membership
  end
end
