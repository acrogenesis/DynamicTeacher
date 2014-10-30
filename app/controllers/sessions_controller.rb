class SessionsController < Devise::SessionsController
  def create
    if params[:user][:email].match(/[aAlL]\d{8}/)
      params[:user][:email] = "#{params[:user][:email]}@itesm.mx"
      request[:user][:email] = params[:user][:email]
      super
    else
      redirect_to root_path, alert: 'No es una matricula valida'
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_dashboard_path
    elsif current_user.user?
      dashboard_path
    end
  end
end
