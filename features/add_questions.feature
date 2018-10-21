Feature:Add a new question
  
  As an admin
  So that I can add a question not on the database
  I want to add a new question
  
   Given the following users exist:
  | name        | email         | created_at        | role  | encrypted_password|
  | Xien        | xthomas       | shieldedRavine    | admin       |     123           |
  | Edmaad      | edScrumMaster | shovelWaterSpirit | user       |     567           |
  | Alien       | iAmReal       | sugarStarWars     | user     |                |
  | George      | armyOfOne     | georgeOfTheJungle | user       |                |

  Scenario: adding a new user
  Given I am on the home page
  Then I follow "Sign in"
  And  I fill in "Email" with "xien.thomas@email.com"
  And  I fill in "Password" with "password"
  And  I press "Sign in"
  When I am on the homepage
  # And I follow "Add"
  # Then I should be redirected to New Question Page
  
  Scenario: adding content of new question
  When I am on the New Question Page
  And I fill "content" with "Question"
  And I fill "qtype" with "T/F"
  And I fill "answer" with "option1"
  And I fill "explanation" with "exp"
  And I press "Create Question"
  Then I should be redirected to the Question Successfully Created Page
  
  Scenario: adding a new true or false question
    When I am on the New Question Page
    And I select "True or False" from "question_qtype"
    And I fill in "question_content" with "Question?"
    And I fill in "Topic 1" for "question_topic"
    And I choose "op2"
    And I press "Create Question"
    Then I should be redirected to "Show" of "1" 
    
  Scenario: adding a new MCQ question
    When I am on the New Question Page
    And I select "Multiple Choice" from "question_qtype"
    And I fill in "question_content" with "Question?"
    And I fill in "Topic 1" for "question_topic"
    And I fill in "optional 1" for "question_option1"
    And I fill in "optional 2" for "question_option2"
    And I fill in "optional 3" for "question_option3"
    And I fill in "optional 4" for "question_option4"
    And I choose "op2"
    And I press "Create Question"
    Then I should be redirected to "Show" of "1"
    And I should see "Topic 1"
    And I should see "optional 1"
    And I should see "optional 2"
    And I should see "optional 3"
    And I should see "optional 4"
    And I should see "Question?"
    And I should see "Multiple Choice"
    
  Scenario: adding a new TF question
    When I am on the New Question Page
    And I select "True or False" from "question_qtype"
    And I fill in "question_content" with "Question?"
    And I fill in "Topic 2" for "question_topic"
    And I choose "op2"
    And I press "Create Question"
    Then I should be redirected to "Show" of "1"
    And I should see "Topic 2"
    And I should see "True"
    And I should see "False"
    And I should see "nil"
    And I should see "nil"
    And I should see "Question?"
    And I should see "True or False"
  
  Scenario: Going back from the new question page
  When I am on the New Question Page
  And I follow "Back"
  Then I should be redirected to the Question list Page
  
  Scenario: adding a new question
  When I am on the Question List Page
  And I follow "New Question"
  Then I should be redirected to New Question Page