# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creando Examenes Diagnosticos...'
Subject.subjects.each do |subject|
  DiagnosticExam.create(subject: subject) if DiagnosticExam.where(subject: subject).empty?
end

puts 'Creando Tareas...'
homeworks = Dir[File.join('db/homeworks/*')].sort

homeworks.each do |homework|
  subject, level = File.basename(homework).split('-')
  Homework.create(subject: subject, level: level, description: File.read(homework)) if Homework.where(subject: subject, level: level, description: File.read(homework)).empty?
end

puts 'Creando Videos...'
videos = [
  {
    url: '//www.youtube.com/embed/T4RPkiXjqd8',
    subject: 'ifs',
    title: 'Estatuos de Decision #1'
  },
  {
    url: '//www.youtube.com/embed/iFJ8xRgRoXg',
    subject: 'switches',
    title: 'Estatuos de Decision #2'
  },
  {
    url: '//www.youtube.com/embed/xAQiw-uoNeE',
    subject: 'cycles',
    title: 'Ciclos #1'
  }
]

videos.each do |video|
  Video.create(video) if Video.where(video).empty?
end
