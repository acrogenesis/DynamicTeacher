class DashboardController < ApplicationController
  def index
    @homeworks = HomeworkUser.homeworks(current_user)
    @pending_homeworks =  Homework.all - @homeworks
  end
end
