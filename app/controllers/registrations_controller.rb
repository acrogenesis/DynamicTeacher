class RegistrationsController < Devise::RegistrationsController
  def create
    if params[:user][:email].match(/[aAlL]\d{8}/)
      params[:user][:email] = "#{params[:user][:email]}@itesm.mx"
      super
    else
      flash.now[:alert] = 'No es una matricula valida'
      redirect_to root_path
    end
  end

  protected

  def after_sign_up_path_for(resource)
    dashboard_path
  end
end
