class RenameTypeToHwType < ActiveRecord::Migration
  def self.up
    rename_column :homeworks, :type, :hw_type
  end

  def self.down
    rename_column :homeworks, :hw_type, :type
  end
end
