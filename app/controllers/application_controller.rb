class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :check_first_diagnostic_exam

  def check_first_diagnostic_exam
    if user_signed_in? && !current_user.admin?
      if current_user.level
        return
      else
        redirect_to diagnostic_exam_path(DiagnosticExam.where(subject: 'basic').first.id)
      end
    end
  end
end
