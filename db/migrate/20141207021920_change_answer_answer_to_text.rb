class ChangeAnswerAnswerToText < ActiveRecord::Migration
  def up
    change_column :answers, :answer, :text
  end

  def down
    change_column :answers, :answer, :string
  end
end
