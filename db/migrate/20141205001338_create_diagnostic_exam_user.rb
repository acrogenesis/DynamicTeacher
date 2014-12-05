class CreateDiagnosticExamUser < ActiveRecord::Migration
  def up
    create_table :diagnostic_exam_users do |t|
      t.belongs_to :diagnostic_exam
      t.belongs_to :user
      t.float :grade

      t.timestamps
    end
    add_index :diagnostic_exam_users, [:diagnostic_exam_id, :user_id]
    add_index :diagnostic_exam_users, :user_id
  end

  def down
    drop_table :diagnostic_exam_users
  end
end
