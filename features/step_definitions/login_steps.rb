Given /the following users exist/ do |table|
    table.hashes.each.each do |users|
        User.create(users)
    end
end

Given /I am an admin/ do 
    c_user = User.create!("example@ex.com","password")
    c_user.set_admin
end

# When("I choose {string} for {string}") do |string, string2|
#     choose(string2, option: string)
# end
# Then /^(?:|I )should be on (.+)$/ do |page_name|
#   current_path = URI.parse(current_url).path
#   if current_path.respond_to? :should
#     current_path.should == path_to(page_name)
#   else
#     assert_equal path_to(page_name), current_path
#   end
# end