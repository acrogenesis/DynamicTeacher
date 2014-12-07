class AddSubjectLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :subject, :string
    add_column :users, :level, :integer
  end
end
