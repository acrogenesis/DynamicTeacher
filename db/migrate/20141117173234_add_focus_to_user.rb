class AddFocusToUser < ActiveRecord::Migration
  def change
    add_column :users, :focus, :string
  end
end
