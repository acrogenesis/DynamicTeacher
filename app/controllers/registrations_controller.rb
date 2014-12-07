class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def create
    if params[:user][:email].match(/[aAlL]\d{8}/)
      params[:user][:email] = "#{params[:user][:email]}@itesm.mx"
      devise_create
    else
      redirect_to root_path, alert: 'No es una matricula valida'
    end
  end


  protected

  def devise_create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      # respond_with resource
      redirect_to root_path, alert: resource.errors.full_messages
    end
  end

  def after_sign_up_path_for(resource)
    diagnostic_exam_path(DiagnosticExam.where(subject: 'basic').first.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:group_id, :focus)
  end
end
