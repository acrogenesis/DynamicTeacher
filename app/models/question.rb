class Question < ActiveRecord::Base
  belongs_to :diagnostic_exams
  belongs_to :practices

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true

  def correct_answer
    answers.where(correct: true)
  end

  def check(answer)
    check_answers = correct_answer.map(&:id)
    check_answers.include? answer.to_i
  end
end
