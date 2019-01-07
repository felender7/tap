class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :masquerade_user!
  before_action :get_document_number
  before_action :calculating_tap_score



  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:profile_type, :phone,:varification])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_type, :phone, :varification])
      end

      def get_document_number
        if user_signed_in?
          @document_count = current_user.documents.count
          @cv_count = current_user.cvs.count
        end
      end

      def calculating_tap_score
        if user_signed_in?
         if current_user.documents.empty?
           @tap_score = 4
         else
           @tap_score = 8
         end
      end
    end

  end
