class Question < ActiveRecord::Base
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true

  def correct_answer
    answers.where(correct: true)
  end
end
