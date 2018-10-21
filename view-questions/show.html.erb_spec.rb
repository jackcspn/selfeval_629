require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      :content => "Content",
      :option1 => "Option1",
      :option2 => "Option2",
      :option3 => "Option3",
      :option4 => "Option4"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Option1/)
    expect(rendered).to match(/Option2/)
    expect(rendered).to match(/Option3/)
    expect(rendered).to match(/Option4/)
  end
end