class DiagnosticExamUsersController < ApplicationController
  def new
    @diagnostic_exam_user = DiagnosticExamUser.new
  end

  def create
    grade = DiagnosticExam.find(diagnostic_exam_user_params[:diagnostic_exam_id]).check(params['answers'])
    new_params = diagnostic_exam_user_params.merge('grade' => grade)
    @diagnostic_exam_user = DiagnosticExamUser.new(new_params)
    if @diagnostic_exam_user.save
      redirect_to dashboard_path
    else
      redirect_to diagnostic_exam_path(@diagnostic_exam_user.diagnostic_exam_id)
    end
  end

  private

  def diagnostic_exam_user_params
    params.require(:diagnostic_exam_user).permit(:diagnostic_exam_id, :user_id)
  end
end
