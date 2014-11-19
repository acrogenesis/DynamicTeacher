class Admin::DiagnosticExamsController < ApplicationController
  before_action :set_diagnostic_exam, only: [:show, :edit, :update, :destroy]

  def new
    @diagnostic_exam = DiagnosticExam.new
  end

  def edit
  end

  def create
    @diagnostic_exam = DiagnosticExam.new(diagnostic_exam_params)

    if @diagnostic_exam.save
      redirect_to admin_dashboard_path
    else
      redirect_to admin_dashboard_path
    end
  end

  def update
    if @diagnostic_exam.update(diagnostic_exam_params)
      redirect_to admin_dashboard_path
    else
      redirect_to admin_dashboard_path
    end
  end

  def destroy
    @diagnostic_exam.destroy
  end

  private

  def set_diagnostic_exam
    @diagnostic_exam = DiagnosticExam.find(params[:id])
  end

  def diagnostic_exam_params
    params.require(:diagnostic_exam).permit(:subject)
  end
end
