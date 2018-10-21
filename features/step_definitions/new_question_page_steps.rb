Then("I should be redirected to New Question Page") do
  visit "/questions/new"
end

Then("I should be redirected to the Question Successfully Created Page") do
  visit "/questions"
end

Then("I should be redirected to the Question list Page") do
  visit questions_path 
end

When("I fill {string} with {string}") do |string, string2|
  question = Question.new()
  if (string == "content")
    question.content = string2
  elsif (string == "answer")
    question.answer = string2
  elsif (string == "qtype")
    question.qtype = string2
  elsif (string == "option1")
    question.option1 = string2
  elsif (string == "option2")
    question.option2 = string2
  elsif (string == "option3")
    question.option3 = string2
  elsif (string == "option4")
    question.option4 = string2
  elsif (string == "explanation")
    question.explanation = string2
  end
  question.save
end

Then("{string} should be {string}") do |string, string2|
  question = Question.find_by_id "1"
  if (string == "content")
    question.content.should == string2
  elsif (string == "answer")
    question.answer.should == string2
  elsif (string == "qtype")
    question.qtype.should == string2
  elsif (string == "option1")
    question.option1.should == string2
  elsif (string == "option2")
    question.option2.should == string2
  elsif (string == "option3")
    question.option3.should == string2
  elsif (string == "option4")
    question.option4.should == string2
  elsif (string == "explanation")
    question.explanation.should == string2
  end
end

Then("I should be redirected to {string} of {string}") do |string, string2|
  visit question_path(string2)
end