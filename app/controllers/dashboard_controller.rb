class DashboardController < ApplicationController
  def index
    @homeworks = Homework.all
  end
end
