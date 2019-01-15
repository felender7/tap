class FindJobsController < ApplicationController

  def index
    @find_jobs = Job.all
  end


  def show

  end

end
