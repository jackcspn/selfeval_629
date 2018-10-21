Then("I should be redirected to the summary page") do
  visit "/summary"
end

Then("I should be redirected to the sign up page") do
  visit root_path
end