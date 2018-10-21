include Warden::Test::Helpers
Warden.test_mode!

# Feature: User profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'User profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see my own email address
  scenario 'user sees own profile' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    expect(page).to have_content 'User'
    expect(page).to have_content user.email
  end
  
  scenario 'user as admin update users' do
    user = FactoryGirl.create(:user, :admin)
    other = FactoryGirl.create(:user, email: "other@example.com")
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
    expect(page).to have_content 'User'
    click_button 'Change Role'
    expect(page).to have_content 'User updated.'
  end
  
  scenario 'user as admin delete users' do
    user = FactoryGirl.create(:user, :admin)
    other = FactoryGirl.create(:user, email: "other@example.com")
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
    expect(page).to have_content 'User'
    click_link 'Delete user'
    expect(page).to have_content 'User deleted.'
  end
  
  # scenario 'user as admin delete users' do
  #   user = FactoryGirl.create(:user, :admin)
  #   other = FactoryGirl.create(:user, email: "other@example.com")
  #   login_as(user, scope: :user)
  #   visit users_path
  #   expect(page).to have_content user.email
  #   expect(page).to have_content 'User'
  #   click_link 'Delete user'
  #   expect(page).to have_content 'Unable to update user.'
  # end
  
  scenario 'user can delete own account' do
    # skip 'skip a slow test'
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit edit_user_registration_path(user)
    expect(page).to have_content 'User'
    click_button 'Cancel my account'
    # page.driver.browser.switch_to.alert.accept
    expect(page).to have_content I18n.t 'devise.registrations.destroyed'
  end
  # Scenario: User cannot see another user's profile
  #   Given I am signed in
  #   When I visit another user's profile
  #   Then I see an 'access denied' message
  scenario "user cannot see another user's profile" do
    me = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user, email: 'other@example.com')
    login_as(me, :scope => :user)
    Capybara.current_session.driver.header 'Referer', root_path
    visit user_path(other)
    expect(page).to have_content 'Access denied.'
  end

end
