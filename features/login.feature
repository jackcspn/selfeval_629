Feature: Login to the website
 
  This is a main page for users (Admin or students) to login into their account
  
  Rules:
  -users must be able to see username and password
  -users must be able to type their username and password
  -users must be able to click a button to upload credentials
 
Background: Users in a database
 
  Given the following users exist:
  | name        | email                   | created_at        | role        | password    |
  | Xien        | xthomas@test.com        | shieldedRavine    | admin       | xienpw123   |
  | Edmaad      | edScrumMaster@test.com  | shovelWaterSpirit | user        | edmaadpw123 |
  | Alien       | iAmReal@test.com        | sugarStarWars     | user        | alienpw123  |
  | George      | armyOfOne@test.com      | georgeOfTheJungle | user        | georgepw123 |

Scenario: verify output when email id is entered
  Given I am on the home page
  Then I follow "Sign in"
  And  I fill in "Email" with "edScrumMaster@test.com"
  And  I fill in "Password" with "edmaadpw123"
  And  I press "Sign in"
  Then I should be on the homepage
  And I should see "Signed in successfully."
 
Scenario: verify signup from login page
  Given I am on the home page
  Then I follow "Sign up"
  And  I fill in "Name" with "john"
  And  I fill in "Password" with "johnpw123"
  And  I fill in "Email" with "john@email.com"
  And  I fill in "Password confirmation" with "johnpw123"
  And I press "Sign up"
  Then I should be on the homepage
  And I should see "You have signed up successfully."
  
Scenario: verify output when email id is entered wrong (sad path)
  Given I am on the home page
  Then I follow "Sign in"
  Then  I follow "Sign up now"
  And  I fill in "Name" with "mike"
  And  I fill in "Password" with "mikepw123"
  And  I fill in "Email" with "m"
  And  I fill in "Password confirmation" with "mikepw123"
  And I press "Sign up"
  And I should not see "You have signed up successfully."
  
Scenario: admin sign in
  Given I am on the home page
  Then I follow "Sign in"
  And  I fill in "Password" with "xienpw123"
  And  I fill in "Email" with "xthomas@test.com "
  And I press "Sign in"
  Then I should be on the home page
  
  
Scenario: admin deleting users
  Given I am on the home page
  Then I follow "Sign in"
  And  I fill in "Password" with "xienpw123"
  And  I fill in "Email" with "xthomas@test.com "
  And I press "Sign in"
  And I am on the home page
  And I follow "Users"
  And I am on the users page
  And I follow "iamreal@test.com"
  Then I should see "Name: Alien"
  And I should see "Email: iamreal@test.com"
  
# Scenario: add User to existing Database
#   Given I am on the login page
#   And  I fill in "Username" with "edScrumMaster"
#   And  I fill in "Password" with "shovelWaterSpirit"
#   And  I press "login"
#   Then I should be on the home page of "Users"
  
#   Then the director of "Alien" should be "Ridley Scott"
 
# Scenario: find movie with same director
#   Given I am on the details page for "Star Wars"
#   When  I follow "Find Movies With Same Director"
#   Then  I should be on the Similar Movies page for "Star Wars"
#   And   I should see "THX-1138"
#   But   I should not see "Blade Runner"
 
# Scenario: can't find similar movies if we don't know director (sad path)
#   Given I am on the details page for "Alien"
#   Then  I should not see "Ridley Scott"
#   When  I follow "Find Movies With Same Director"
#   Then  I should be on the home page
#   And   I should see "'Alien' has no director info"
