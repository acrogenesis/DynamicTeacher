class DashboardController < ApplicationController
  def index
    @homeworks = HomeworkUser.homeworks(current_user)
    @pending_homeworks =  Homework.specifc_homeworks(subject: current_user.subject, level: current_user.level) - @homeworks
    @practices = Practice.all
    @video_hash = {}
    Subject.subjects.each do |subject|
      @video_hash.merge!(subject => Video.where(subject: subject))
    end
    flash[:warning] = "Tienes un Examen Diagnostico pendiente <strong>#{view_context.link_to 'ir a examen', next_diagnostic_exam_path}</strong>".html_safe if @pending_homeworks.empty?
  end

  private

  def next_diagnostic_exam_path
    diagnostic_exam_path(DiagnosticExam.where(subject: Subject.next(current_user.subject)).first.id)
  end
end
