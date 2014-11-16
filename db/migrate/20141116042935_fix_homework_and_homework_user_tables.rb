class FixHomeworkAndHomeworkUserTables < ActiveRecord::Migration
  def self.up
    add_column :homeworks_users, :grade, :float
    add_column :homeworks_users, :comment, :string
    add_column :homeworks_users, :delivered, :datetime

    remove_column :homeworks, :grade
    remove_column :homeworks, :comment
    remove_column :homeworks, :delivered
  end

  def self.down
    remove_column :homeworks_users, :grade
    remove_column :homeworks_users, :comment
    remove_column :homeworks_users, :delivered

    add_column :homeworks, :grade, :float
    add_column :homeworks, :comment, :string
    add_column :homeworks, :delivered, :datetime
  end
end
