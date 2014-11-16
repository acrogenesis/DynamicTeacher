class Homework < ActiveRecord::Base
  has_and_belongs_to_many :users

  def delivered_icon
    if delivered
      'check'
    else
      'times'
    end
  end
end
