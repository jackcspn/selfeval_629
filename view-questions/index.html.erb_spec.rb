require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :content => "Content",
        :option1 => "Option1",
        :option2 => "Option2",
        :option3 => "Option3",
        :option4 => "Option4"
      ),
      Question.create!(
        :content => "Content",
        :option1 => "Option1",
        :option2 => "Option2",
        :option3 => "Option3",
        :option4 => "Option4"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Option1".to_s, :count => 2
    assert_select "tr>td", :text => "Option2".to_s, :count => 2
    assert_select "tr>td", :text => "Option3".to_s, :count => 2
    assert_select "tr>td", :text => "Option4".to_s, :count => 2
  end
end