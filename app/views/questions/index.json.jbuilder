json.array!(@questions) do |question|
  json.extract! question, :id, :descricao, :correct_answer_id, :answer_id, :subject_id
  json.url question_url(question, format: :json)
end
