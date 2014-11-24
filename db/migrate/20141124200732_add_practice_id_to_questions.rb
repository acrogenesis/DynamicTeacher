class AddPracticeIdToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :practice, index: true
  end
end
