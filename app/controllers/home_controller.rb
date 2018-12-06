class HomeController < ApplicationController

  def index
     @company_details = CompanyDetail.all
  end

  def company
    @company_details = CompanyDetail.all
  end

  def terms
  end

  def privacy
  end


end
