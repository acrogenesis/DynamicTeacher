class Subject
  SUBJECTS = %w(basic concepts functions ifs switches cycles arrays matrices character_arrays)

  def self.subjects
    SUBJECTS
  end

  def self.next(current)
    SUBJECTS[SUBJECTS.index(current)+1]
  end
end
