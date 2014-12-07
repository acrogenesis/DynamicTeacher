class Admin::DashboardController < Admin::ApplicationController
  def index
    @homeworks = Homework.all
    @pending_homeworks = HomeworkUser.all
    @groups = Group.all
    @diagnostic_exams = DiagnosticExam.all
    @practices = Practice.all
    @videos = Video.all
  end
end
