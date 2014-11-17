class HomeworkUser < ActiveRecord::Base
  self.table_name = 'homeworks_users'
  mount_uploader :file, HomeworkUploader

  def self.homeworks(user_id)
    where(user_id: user_id).map(&:homework)
  end

  def homework
    Homework.find(homework_id)
  end

  def user
    User.find(user_id)
  end

  def inline_grade
    if grade.nil?
      'SC'
    else
      grade
    end
  end

  def inline_grade=(inline_grade)
    self.grade = inline_grade
  end

  def inline_comment
    if comment.nil?
      'Sin Comentario'
    else
      comment
    end
  end

  def inline_comment=(inline_comment)
    self.comment = inline_comment
  end
end
