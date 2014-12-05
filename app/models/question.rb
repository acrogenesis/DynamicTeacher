class Question < ActiveRecord::Base
  belongs_to :diagnostic_exams
  belongs_to :practices

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true

  def correct_answer
    answers.where(correct: true).first
  end

  def check(answer)
    answer.to_i == correct_answer.id
  end
end
