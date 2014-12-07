class HomeworkUserPolicy < ApplicationPolicy
  def create?
    record.user_id == user.id
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
