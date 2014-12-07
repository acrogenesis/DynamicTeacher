class DiagnosticExamUserPolicy < ApplicationPolicy
  def create?
    record.user_id == user.id
  end
end
