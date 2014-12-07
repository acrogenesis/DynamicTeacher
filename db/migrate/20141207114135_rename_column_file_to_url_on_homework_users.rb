class RenameColumnFileToUrlOnHomeworkUsers < ActiveRecord::Migration
  def up
    rename_column :homeworks_users, :file, :url
  end

  def down
    rename_column :homeworks_users, :url, :file
  end
end
