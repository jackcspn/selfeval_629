Feature:Add a new question
  
   As a user
  So that I can add a question not on the database
  I want to add a new question
  
 
  
  Scenario: Going back from the new question page
    Given I am loggedin as regular user "reguser@test.com" with password "reguserpw123"
    When I am on the New Question Page
    And I follow "Back"
    Then I should be redirected to the Question list Page
   
  Scenario: adding a new question
    Given I am loggedin as regular user "reguser@test.com" with password "reguserpw123"
    When I am on the Question List Page
    And I follow "New Question"
    Then I should be redirected to New Question Page
  
  Scenario: adding a new true or false question
    Given I am loggedin as regular user "reguser@test.com" with password "reguserpw123"
    When I am on the New Question Page
    And I select "True or False" from "question_qtype"
    And I select "General" from "Topic"
    And I fill in "Content" with "Question content"
    And I choose "op1"
    And I fill "explanation" with "exp"
    And I press "Create Question"
    Then I should be redirected to "Show" of "1"
    And I should see "Question content"
    And I should see "True or False"
    And I should see "Approved: No"
    And I should see "Option1: True"
    And I should see "Option3: nil"
    And I should see "Answer: option1"
    And I should see "General"
    
  Scenario: adding a new MCQ question
    Given I am loggedin as regular user "reguser@test.com" with password "reguserpw123"
    When I am on the New Question Page
    And I select "Multiple Choice" from "question_qtype"
    And I fill in "question_content" with "Question?"
    And I select "Math" from "question_topic"
    And I fill in "optional 1" for "question_option1"
    And I fill in "optional 2" for "question_option2"
    And I fill in "optional 3" for "question_option3"
    And I fill in "optional 4" for "question_option4"
    And I choose "op2"
    And I press "Create Question"
    Then I should be redirected to "Show" of "1"
    And I should see "Math"
    And I should see "optional 1"
    And I should see "optional 2"
    And I should see "optional 3"
    And I should see "optional 4"
    And I should see "Question?"
    And I should see "Multiple Choice"
    
    Scenario: adding a new question by admin
    Given I am an admin
    When I am on the New Question Page
    And I select "True or False" from "question_qtype"
    And I select "General" from "Topic"
    And I fill in "Content" with "Question content"
    And I choose "op1"
    And I fill "explanation" with "exp"
    And I press "Create Question"
    Then I should be redirected to "Show" of "1"
    And I should see "Question content"
    And I should see "True or False"
    And I should see "Approved: Yes"
    And I should see "Option1: True"
    And I should see "Option3: nil"
    And I should see "Answer: option1"
    And I should see "General"
    