class FindJobsController < ApplicationController
  def index
    @jobs = Job.all
  end
end
