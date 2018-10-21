require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :content => "MyString",
      :option1 => "MyString",
      :option2 => "MyString",
      :option3 => "MyString",
      :option4 => "MyString",
      :answer => "option4"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[content]"

      assert_select "input[name=?]", "question[option1]"

      assert_select "input[name=?]", "question[option2]"

      assert_select "input[name=?]", "question[option3]"

      assert_select "input[name=?]", "question[option4]"
      
      assert_select "input[name=?]", "question[answer"
    end
  end
end