class UsersController < ApplicationController
  before_action :display_user_content, only:[:show]
  before_action :authenticate_user!, only:[:show]

  def index
    @users = User.where(profile_type: "Individual").order("updated_at DESC")
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def display_user_content
      @user = User.friendly.find(params[:id])
      @display_cv = @user.cvs
      @display_documents = @user.documents.order("created_at DESC")
  end

  # check if  the current user login in can view the page
  def check_current_profile
     if user_signed_in?
       if current_user.profile_type == "Individual"
         redirect_to root_path , notice:"Not authorised to view this page"
       end
     end
  end
end
