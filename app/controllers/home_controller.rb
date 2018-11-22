class HomeController < ApplicationController
    before_action :check_profile_type
  def index

  end

  def terms
  end

  def privacy
  end

    private

  #check profile type on login
  def check_profile_type
   if user_signed_in?
      if current_user.profile_type == "Individual"
           root_path
        elsif current_user.profile_type == "Company"
          redirect_to company_path
      end
    end
  end
end
