class Admin::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_admin_user!

  def authenticate_admin_user!
    redirect_to dashboard_path if current_user.user?
  end
end
