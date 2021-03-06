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

d = DiagnosticExam.where(subject: 'basic_concepts').first
q = Question.create(question: 'Los siguientes son tipos de datos en C#', diagnostic_exam_id: d.id)
Answer.create(answer: 'bool', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'string', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'long', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'decimal', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'char', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'short', field_type: 'check_box', correct: true, question_id: q.id)

q = Question.create(question: 'Una variable local', diagnostic_exam_id: d.id)
Answer.create(answer: 'Puede ser utilizada en cualquier lugar del programa', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Se declara dentro de un método (main)', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Debe ser instanciada desde su declaración', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Ninguna de las anteriores', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'El método Console.ReadLine() se utiliza para leer el input del usuario en consola', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: true, question_id: q.id)

q = Question.create(question: 'Una variable global', diagnostic_exam_id: d.id)
Answer.create(answer: 'Puede ser utilizada en cualquier lugar del programa', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Se declara dentro de un método (main)', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Debe ser instanciada desde su declaración', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Ninguna de las anteriores', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Al momento de declarar una variable, siempre se debe de instanciar (inicializar)', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Método utilizado para convertir de un String a un número entero', diagnostic_exam_id: d.id)
Answer.create(answer: 'texto.toInteger()', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Int.parse(texto)', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'parse(texto)', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Diferencia entre las comillas simples (\') y las dobles (")', diagnostic_exam_id: d.id)
Answer.create(answer: 'No hay diferencia', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Las comillas simples son para caracteres y las dobles para strings', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Las comillas simples son para strings y las dobles para caracteres', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Método utilizado para imprimir algún texto a pantalla', diagnostic_exam_id: d.id)
Answer.create(answer: 'Console.WriteLine()', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Console.Print()', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'System.WriteLine()', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'System.Print()', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'x = 3 / 2, ¿Cuál es el valor de x?', diagnostic_exam_id: d.id)
Answer.create(answer: '1', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: '1.5', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: '2', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'x = 3 / 2, ¿Cuál es el valor de x?', diagnostic_exam_id: d.id)
Answer.create(answer: '1', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: '1.5', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: '2', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'x = 3 / 2.0, ¿Cuál es el valor de x?', diagnostic_exam_id: d.id)
Answer.create(answer: '1', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: '1.5', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: '2', field_type: 'radio_button', correct: false, question_id: q.id)

d = DiagnosticExam.where(subject: 'switches').first
q = Question.create(question: 'Cuando se ejecuta el default', diagnostic_exam_id: d.id)
Answer.create(answer: 'Si no se cumplió ningún caso', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Después de que se ejecutó un caso', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Siempre', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Nunca', field_type: 'radio_button', correct: true, question_id: q.id)

q = Question.create(question: 'Qué tipo de datos puede recibir un switch', diagnostic_exam_id: d.id)
Answer.create(answer: 'bool', field_type: 'check_box', correct: false, question_id: q.id)
Answer.create(answer: 'string', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'int', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'char', field_type: 'check_box', correct: true, question_id: q.id)
Answer.create(answer: 'decimal', field_type: 'check_box', correct: false, question_id: q.id)

q = Question.create(question: 'Qué pasa si no utilizas un break por cada clase', diagnostic_exam_id: d.id)
Answer.create(answer: 'Sólo se ejecuta el primero de los casos', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Se ejecutan múltiples casos', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'No pasa nada', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Sé pueden utilizar múltiples tipos de datos para un switch', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Se pueden repetir los casos dentro de un switch', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Se puede evaluar más de una variable en un switch', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Un switch puede tener más de un caso seguido (case 1: case 2: break;)', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: true, question_id: q.id)

q = Question.create(question: 'Un switch puede contener otro switch ', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: true, question_id: q.id)

d = DiagnosticExam.where(subject: 'ifs').first
q = Question.create(question: 'El if se ejecuta cuando', diagnostic_exam_id: d.id)
Answer.create(answer: 'Se cumple la condición', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'No se cumple la condición', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Nunca', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Siempre', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'El else se ejecuta cuando', diagnostic_exam_id: d.id)
Answer.create(answer: 'Se cumple la condición', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'No se cumple la condición', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Nunca', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Siempre', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Un else if se ejecuta cuando', diagnostic_exam_id: d.id)
Answer.create(answer: 'Se cumple la condición, después de que fallo la del if', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'No se cumple la condición, después de que fallo la del if', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Se cumple la condición, después de que se realizó la del if', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'No se cumple la condición, después de que se realizó la del if', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Se puede anidar un if dentro de otro', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: true, question_id: q.id)

q = Question.create(question: 'El tipo de dato de la condición es de tipo', diagnostic_exam_id: d.id)
Answer.create(answer: 'bool', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'string', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'int', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'char', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'decimal', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Límite de la cantidad de else ifs que puede haber', diagnostic_exam_id: d.id)
Answer.create(answer: 'Solamente uno', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Dos a tres', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'No hay limite', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'No se puede poner else if', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'Un if puede tener más de una condición', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: true, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: false, question_id: q.id)

q = Question.create(question: 'If (true) siempre se ejecutara', diagnostic_exam_id: d.id)
Answer.create(answer: 'Falso', field_type: 'radio_button', correct: false, question_id: q.id)
Answer.create(answer: 'Verdadero', field_type: 'radio_button', correct: true, question_id: q.id)

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
  },
  {
    url: '//www.youtube.com/embed/OfT0585DZUg',
    subject: 'cycles',
    title: 'Ciclos #2'
  },
  {
    url: '//www.youtube.com/embed/cTrwF_NflK0',
    subject: 'cycles',
    title: 'Ciclos #3'
  }
]

videos.each do |video|
  Video.create(video) if Video.where(video).empty?
end

puts 'Creando Ejercicios...'

practices = Dir[File.join('db/practices/*.cs')].sort
practices.each do |practice|
  subject, _extension = File.basename(practice).split('.')
  Practice.create(subject: subject) if Practice.where(subject: subject).empty?
end

pr = Practice.where(subject: 'basic_concepts').first
q = Question.create(question: File.read('db/practices/basic_concepts.md'), practice_id: pr.id)
Answer.create(answer: File.read('db/practices/basic_concepts.cs'), field_type: 'code', correct: true, question_id: q.id)

pr = Practice.where(subject: 'cycles').first
q = Question.create(question: File.read('db/practices/cycles.md'), practice_id: pr.id)
Answer.create(answer: File.read('db/practices/cycles.cs'), field_type: 'code', correct: true, question_id: q.id)

pr = Practice.where(subject: 'functions').first
q = Question.create(question: File.read('db/practices/functions.md'), practice_id: pr.id)
Answer.create(answer: File.read('db/practices/functions.cs'), field_type: 'code', correct: true, question_id: q.id)

pr = Practice.where(subject: 'ifs').first
q = Question.create(question: File.read('db/practices/ifs.md'), practice_id: pr.id)
Answer.create(answer: File.read('db/practices/ifs.cs'), field_type: 'code', correct: true, question_id: q.id)

pr = Practice.where(subject: 'switches').first
q = Question.create(question: File.read('db/practices/switches.md'), practice_id: pr.id)
Answer.create(answer: File.read('db/practices/switches.cs'), field_type: 'code', correct: true, question_id: q.id)

pr = Practice.where(subject: 'arrays').first
q = Question.create(question: File.read('db/practices/arrays.md'), practice_id: pr.id)
Answer.create(answer: File.read('db/practices/arrays.cs'), field_type: 'code', correct: true, question_id: q.id)

pr = Practice.where(subject: 'matrices').first
q = Question.create(question: File.read('db/practices/matrices.md'), practice_id: pr.id)
Answer.create(answer: File.read('db/practices/matrices.cs'), field_type: 'code', correct: true, question_id: q.id)

puts 'Creando grupos...'

Group.create(schedule: '1030 LuJu', name: 'Fundamentos de Programación')
Group.create(schedule: '12 LuJu', name: 'Fundamentos de Programación')
