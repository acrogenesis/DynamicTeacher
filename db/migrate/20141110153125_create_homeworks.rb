class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :level
      t.string :type
      t.string :subject
      t.string :description
      t.datetime :deadline
      t.datetime :delivered
      t.string :comment
      t.float :grade

      t.timestamps
    end
  end
end
