class User < ActiveRecord::Base
  has_and_belongs_to_many :homeworks
  has_and_belongs_to_many :diagnostic_exams

  belongs_to :groups

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

  FOCUS = %w(INT ITC LAD)

  def set_default_role
    self.role ||= :user
  end

  def self.focus
    FOCUS
  end
end
