class DashboardController < ApplicationController
  def index
    h1 = Homework.new(guid: 1, subject: 'Ciclos', delivered: false, deadline: '2 de Nov', grade: nil)
    h2 = Homework.new(guid: 2, subject: 'Condiciones', delivered: true, deadline: '31 de Oct', grade: nil)
    h3 = Homework.new(guid: 3, subject: 'Ciclos', delivered: true, deadline: '30 de Oct', grade: 85)
    h4 = Homework.new(guid: 4, subject: 'Variables', delivered: true, deadline: '27 de Oct', grade: 78)
    h5 = Homework.new(guid: 5, subject: 'Asignaciones', delivered: true, deadline: '20 de Oct', grade: 90)

    @homeworks = [h1, h2, h3, h4, h5]
  end
end

class Homework
  attr_accessor :guid, :subject, :deadline, :delivered, :grade, :comments

  def initialize(args)
    @guid = args[:guid]
    @subject = args[:subject]
    @deadline = args[:deadline]
    @delivered = args[:delivered]
    @grade = args[:grade]
    @comments = 'Aqui van los comentarios de la maestra'
  end

  def delivered_icon
    if delivered
      'check'
    else
      'times'
    end
  end
end
