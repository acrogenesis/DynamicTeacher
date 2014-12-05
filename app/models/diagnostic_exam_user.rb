class DiagnosticExamUser < ActiveRecord::Base
  # self.table_name = 'diagnostic_exams_users'

  def self.diagnostic_exams(user_id)
    where(user_id: user_id).map(&:diagnostic_exam)
  end

  def diagnostic_exam
    DiagnosticExam.find(diagnostic_exam_id)
  end

  def user
    User.find(user_id)
  end
end
