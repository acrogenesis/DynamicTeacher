class DiagnosticExam < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :questions
  has_many :answers, through: :questions

  def check(params_answers)
    grade = 0
    question_value = 100.0 / questions.count
    params_answers.each do |answer|
      if answer[1].is_a?(Array)
        temp_question_value = question_value / answer[1].count
        answer[1].each do |answ|
          grade += temp_question_value if Question.find(answer[0]).check(answ)
        end
      else
        grade += question_value if Question.find(answer[0]).check(answer[1])
      end
    end
    grade.round(2)
  end
end
