Then /^I should see "(.*)" as an equation$/ do |string|
  # page.should have_xpath("//script[@type='math/tex' and @text=#{string}")
  # page.should have_xpath("//script", :visible => false, :text => string)
  page.should have_css("MathJax-Element-1-Frame")
end

When("I am viewing the questions index") do
  visit questions_path 
end