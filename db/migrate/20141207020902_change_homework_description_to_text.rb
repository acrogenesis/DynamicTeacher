class ChangeHomeworkDescriptionToText < ActiveRecord::Migration
  def up
    change_column :homeworks, :description, :text
  end

  def down
    change_column :homeworks, :description, :string
  end
end
