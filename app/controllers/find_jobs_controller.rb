class FindJobsController < ApplicationController
    before_action :set_job, only:[:show, :edit, :update, :destroy]

    def index
      @get_jobs = if params[:term_job].present?
          Job.search(params[:term_job])
        else
          Job.all
        end
    end


    # GET /jobs/1
    # GET /jobs/1.json
    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @get_jobs = Job.friendly.find_by(params[:id])
    end

    def autocomplete
      render json: Job.search(params[:term_job], autocomplete: false, limit: 10).map do |job|
        { title: job.title, value: job.id }
      end
    end
end
