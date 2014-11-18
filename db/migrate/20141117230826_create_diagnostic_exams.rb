class CreateDiagnosticExams < ActiveRecord::Migration
  def change
    create_table :diagnostic_exams do |t|
      t.string :subject

      t.timestamps
    end
  end
end
