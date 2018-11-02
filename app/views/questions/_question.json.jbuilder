json.extract! question, :id, :type, :content, :option1, :option2, :option3, :option4, :answer, :explanation, :display, :feedback, :uid
json.url question_url(question, format: :json)