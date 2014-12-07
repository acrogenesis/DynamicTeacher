class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :check_first_diagnostic_exam

  def index
    redirect_to dashboard_path if user_signed_in?
  end
end
