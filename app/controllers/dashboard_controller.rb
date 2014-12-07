class DashboardController < ApplicationController
  def index
    @homeworks = HomeworkUser.homeworks(current_user)
    @pending_homeworks =  Homework.specifc_homeworks(subject: current_user.subject, level: current_user.level) - @homeworks
    @practices = Practice.all
  end
end
