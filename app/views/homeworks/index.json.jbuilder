json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :level, :type, :subject, :description, :deadline, :delivered, :comment, :grade
  json.url homework_url(homework, format: :json)
end
