class Admin::DashboardController < ApplicationController
  def index
    h1 = ::DashboardController::Homework.new(guid: 1, subject: 'Ciclos', deadline: '2 de Nov', grade: nil)
    h2 = ::DashboardController::Homework.new(guid: 2, subject: 'Condiciones', deadline: '31 de Oct', grade: nil)
    h3 = ::DashboardController::Homework.new(guid: 3, subject: 'Ciclos', deadline: '30 de Oct', grade: nil)
    h4 = ::DashboardController::Homework.new(guid: 4, subject: 'Variables', deadline: '30 de Oct', grade: nil)
    h5 = ::DashboardController::Homework.new(guid: 5, subject: 'Asignaciones', deadline: '29 de Oct', grade: nil)

    @homeworks = [h1, h2, h3, h4, h5]
  end
end
