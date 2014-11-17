class Admin::DashboardController < ApplicationController
  def index
    @homeworks = Homework.all
    @groups = Group.all
  end
end
