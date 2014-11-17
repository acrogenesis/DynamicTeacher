class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def create
    if params[:user][:email].match(/[aAlL]\d{8}/)
      params[:user][:email] = "#{params[:user][:email]}@itesm.mx"
      super
    else
      redirect_to root_path, alert: 'No es una matricula valida'
    end
  end

  protected

  def after_sign_up_path_for(resource)
    dashboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:group_id, :focus)
  end
end
