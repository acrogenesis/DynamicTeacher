class Level
  def self.level_for_grade(grade)
    if grade <= 40
      0
    elsif grade <= 80
      1
    else
      2
    end
  end
end
