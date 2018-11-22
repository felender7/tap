class CompanyController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_canditates = Cv.all
  end


end
