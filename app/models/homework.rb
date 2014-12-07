class Homework < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.specifc_homeworks(attr)
    where(subject: attr[:subject], level: attr[:level])
  end

  def delivered_icon(current_user)
    delivered = HomeworkUser.where(user_id: current_user, homework_id: self).first
    if delivered
      'check'
    else
      'times'
    end
  end

  def grade(current_user)
    hw = HomeworkUser.where(user_id: current_user, homework_id: self).first
    if hw
      if hw.grade
        hw.grade
      else
        'Sin calificar'
      end
    else
      'Sin calificar'
    end
  end

  def comment(current_user)
    hw = HomeworkUser.where(user_id: current_user, homework_id: self).first
    if hw
      if hw.comment
        hw.comment
      else
        'Sin commentarios'
      end
    else
      'Sin commentarios'
    end
  end
end
