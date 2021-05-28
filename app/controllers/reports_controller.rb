class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy hide ]
  before_action :ensure_report_belongs_to_current_user, only: %i[ show edit update destroy ]
  before_action :ensure_report_is_current, only: %i[ edit update ]

  # GET /reports or /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1 or /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)
    @report.user = current_user

    # the report period is based on the created_at date
    # need to have current period be an enum or boolean for period - current, findby
    current_period = Period.first
    @report.period = current_period

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:user_id, :period_id, :current_committees_rocks, :future_committees_rocks, :current_internal_support, :future_internal_support, :current_projects, :future_projects, :current_other, :future_other, :pto, :pvt, :ooo)
    end

  def ensure_report_belongs_to_current_user
    if current_user != @report.user
      redirect_back fallback_location: root_url, alert: "You're not authorized for that."
    end
  end

  def ensure_report_is_current
    if !@report.period.current
      redirect_back fallback_location: root_url, alert: "You're not authorized for that."
    end 
  end
end
