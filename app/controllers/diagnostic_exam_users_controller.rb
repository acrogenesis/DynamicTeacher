class DiagnosticExamUsersController < ApplicationController
  skip_before_filter :check_first_diagnostic_exam

  def new
    @diagnostic_exam_user = DiagnosticExamUser.new
  end

  def create
    diagnostic_exam = DiagnosticExam.find(diagnostic_exam_user_params[:diagnostic_exam_id])
    grade = diagnostic_exam.check(params['answers'])
    level = Level.level_for_grade(grade)
    new_params = diagnostic_exam_user_params.merge('grade' => grade)
    @diagnostic_exam_user = DiagnosticExamUser.new(new_params)
    authorize @diagnostic_exam_user
    if @diagnostic_exam_user.save
      current_user.update_attribute(:level, level)
      current_user.update_attribute(:subject, diagnostic_exam.subject)
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
