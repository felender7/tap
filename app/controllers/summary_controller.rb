class SummaryController < ApplicationController
    def show
      #fetching the cv and document for summary
       @cv = current_user.cvs.find_by(params[:id])
       @documents = Document.all
    end
 end
