class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!

  def after_sign_in_path_for(resource_or_scope)
    new_create_cv_path
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile_type])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_type])
    end


end
