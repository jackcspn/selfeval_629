require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      :content => "MyString",
      :option1 => "MyString",
      :option2 => "MyString",
      :option3 => "MyString",
      :option4 => "MyString"
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[content]"

      assert_select "input[name=?]", "question[option1]"

      assert_select "input[name=?]", "question[option2]"

      assert_select "input[name=?]", "question[option3]"

      assert_select "input[name=?]", "question[option4]"
    end
  end
end