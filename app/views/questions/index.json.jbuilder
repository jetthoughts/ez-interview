json.questions(@questions) do |question|
  json.extract! question, :id, :title, :difficulty
  json.category question.category.name
end