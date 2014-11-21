class PasswordsController < Devise::PasswordsController

  def create
    if params[:user][:email].match(/[aAlL]\d{8}/)
      params[:user][:email] = "#{params[:user][:email]}@itesm.mx"
      super
    else
      redirect_to root_path, alert: 'No es una matricula valida'
    end
  end

  protected

  def after_resetting_password_path_for(resource)
    dashboard_path
  end

  def after_sending_reset_password_instructions_path_for(resource)
    dashboard_path
  end
end
