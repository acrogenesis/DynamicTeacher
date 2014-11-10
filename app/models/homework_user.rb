class HomeworkUser < ActiveRecord::Base
  self.table_name = 'homeworks_users'
  mount_uploader :file, HomeworkUploader
end
