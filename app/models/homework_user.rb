class HomeworkUser < ActiveRecord::Base
  self.table_name = 'homeworks_users'
  mount_uploader :file, HomeworkUploader

  def homework
    Homework.find(homework_id)
  end

  def user
    User.find(user_id)
  end
end
