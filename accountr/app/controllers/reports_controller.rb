class ReportsController < ApplicationController
  def create
  	Report.process_file(file_param[:file])
  	redirect_to reports_path
  end

  def index
  	@report = Report.new
  end

  def new
  end

  private 
 		def file_param
 			params.require(:report).permit(:file)
 		end
end
