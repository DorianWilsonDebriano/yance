class SportsClassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    # record.user == user
    true
  end

  def show?
    true
  end

  def create?
    # record.user == user
    true
  end

  def edit?
    record.trainer.user == user
  end

  def update?
    record.trainer.user == user
  end

  def destroy?
    record.trainer.user == user
  end
end
