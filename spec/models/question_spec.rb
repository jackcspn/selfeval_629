require 'rails_helper'

RSpec.describe Question, type: :model do
 
   it "is not valid without content" do
       question = Question.new(content: nil)
  expect(question).to_not be_valid
 end
   it "is not valid without option1" do
       question = Question.new(option1: nil)
  expect(question).to_not be_valid
  end
   it "is not valid without option2" do
       question = Question.new(option2: nil)
  expect(question).to_not be_valid
  end
   it "is not valid without option3" do
       question = Question.new(option3: nil)
  expect(question).to_not be_valid
  end
   it "is not valid without option4" do
   question = Question.new(option4: nil)
  expect(question).to_not be_valid
  end
  end
  