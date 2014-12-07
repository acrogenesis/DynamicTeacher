# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creando Subjects...'
Subject.subjects.each do |subject|
  DiagnosticExam.create(subject: subject)
end

puts 'Creando Tareas...'
homeworks = Dir[File.join('db/homeworks/*')].sort

homeworks.each do |homework|
  subject, level = File.basename(homework).split('-')
  Homework.create(subject: subject, level: level, description: File.read(homework))
end
