class ReportsController < ApplicationController
  def create
    if params[:report].blank?
      flash[:error] = "You tried to upload an empty file or the file type is invalid!"
    else

      Report.process_file(file_param[:file])
      flash[:notice] = "File Successfully Uploaded"
    end
    redirect_to reports_path

  end
  def index
    @report = Report.new
    @reports_date = Report.all.group_by do |report|
      report.date.strftime("%Y")
    end
  end
  def new
  end
  private
  def file_param
    params.require(:report).permit(:file)
  end
end
