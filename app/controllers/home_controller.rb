class HomeController < ApplicationController
  def index
   @create_cvs = CreateCv.all
  end

  def terms
  end

  def privacy
  end


end
