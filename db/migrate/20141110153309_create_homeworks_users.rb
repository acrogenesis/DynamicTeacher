class CreateHomeworksUsers < ActiveRecord::Migration
  def up
    create_table :homeworks_users do |t|
      t.belongs_to :homework
      t.belongs_to :user

      t.timestamps
    end
    add_index :homeworks_users, [:homework_id, :user_id]
    add_index :homeworks_users, :user_id
  end

  def down
    drop_table :homeworks_users
  end
end
