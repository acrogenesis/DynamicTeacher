class DiagnosticExamController < ApplicationController
  before_action :set_diagnostic_exam, only: :show

  def show
    @diagnostic_exam_user = DiagnosticExamUser.new
  end

  private

  def set_diagnostic_exam
    @diagnostic_exam = DiagnosticExam.find(params[:id])
  end

  # def diagnostic_exam_user_params
  #   params.require(:diagnostic_exam_user).permit(:diagnostic_exam_id, :user_id)
  # end
end
