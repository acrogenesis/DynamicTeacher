class Admin::DashboardController < ApplicationController
  def index
    @homeworks = Homework.all
    @pending_homeworks = HomeworkUser.all
    @groups = Group.all
  end
end
