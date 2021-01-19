class SportsClassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.trainer.user == user
  end

  def update?
    record.trainer.user == user
  end

  def duplicate?
    record.trainer.user == user
  end

  def destroy?
    record.trainer.user == user
  end
end
