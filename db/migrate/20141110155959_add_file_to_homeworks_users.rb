class AddFileToHomeworksUsers < ActiveRecord::Migration
  def change
    add_column :homeworks_users, :file, :string
  end
end
