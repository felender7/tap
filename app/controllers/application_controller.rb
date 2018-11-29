class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!
  #before_action :check_profile_type


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile_type, :phone])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_type, :phone])
    end

    #check profile type on login
    #def check_profile_type
     #if user_signed_in?
        #if current_user.profile_type == ("Individual")
             #root_path
          #else
             #redirect_to '/company'
        #end
      #end
    #end

  end
