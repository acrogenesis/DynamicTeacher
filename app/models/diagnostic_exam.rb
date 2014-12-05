class DiagnosticExam < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :questions
  has_many :answers, through: :questions

  def check(params_answers)
    grade = 0
    question_value = 100.0 / answers.count
    params_answers.each do |answer|
      grade += question_value if Question.find(answer[0]).check(answer[1])
    end
    grade.round(2)
  end
end
