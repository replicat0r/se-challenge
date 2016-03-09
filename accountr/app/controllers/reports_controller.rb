class ReportsController < ApplicationController
  def create
    if params[:report].blank?
      flash[:error] = "File Field Blank"
    else

      Report.process_file(file_param[:file])
      flash[:notice] = "File Successfully Uploaded"
    end
    redirect_to reports_path

  end
  def index
    @report = Report.new
    @reports = Report.all
    @reports_date = Report.all.group_by do |report|
      report.date.strftime("%Y")
    end

    #@reports_date = Report.all(:group => "year(created_at),month(created_at)")
    @column_name = Report.column_names - %w[updated_at created_at id]
  end
  def new
  end
  private
  def file_param
    params.require(:report).permit(:file)
  end
end
