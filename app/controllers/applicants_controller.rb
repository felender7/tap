class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applicant, only: [:show]


  def index
    @applicants = User.where(:profile_type => "Individual").order("created_at DESC")
  end

  def show
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_applicant
    @users = User.all
    @applicant = @users.find(params[:id])
    @users_display_cv =   @applicant.cvs
  end
end
