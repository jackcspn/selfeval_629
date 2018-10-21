# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do

  # Scenario: User can sign in with remember me functionality
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I reset session cookies
  #   Then I should still see sign out link
  it "Still connected if Remember Me box is checked" do
      user = FactoryGirl.create(:user)
      signin_w_rem(user.email, user.password)
      #page.should have_link("Sign out", signout_path)
      expect(page).to have_content I18n.t 'devise.sessions.signed_in'
      #reset_session!
      #get 'del_session_cookies'
      visit root_path
      #expect(page).to have_content 'Sign out'
      expect(page).to have_content 'logged in as'
      #page.should have_link("Sign out", signout_path)
  end


  # Scenario: User cannot sign in if not registered
  #   Given I do not exist as a user
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  # scenario 'user cannot sign in if not registered' do
  #   signin(' ', 'ple')
  #   expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  # end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  scenario 'user can sign in with valid credentials' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  # Scenario: User cannot sign in with wrong email
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  scenario 'user cannot sign in with wrong email' do
     user = FactoryGirl.create(:user)
     signin('invalid@email.com', user.password)
     expect(page).to have_content('Invalid Email or password')
  end

  # Scenario: User cannot sign in with wrong password
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  scenario 'user cannot sign in with wrong password' do
     user = FactoryGirl.create(:user)
     signin(user.email, 'invalidpass')
     expect(page).to have_content('Invalid Email or password')
  end

end
