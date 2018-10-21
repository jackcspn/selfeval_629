Feature: summary of the test questions
  
  As a student
  So that I can determine my total score and answers of the questions
  I want to view total score and answers of the questions
  
  Background: questions in database
    
    Given the following questions exist:
    | content                | qtype           | topic      | option1 | option2     | option3   | option4  | answer  |
    | What color is the sky? | Multiple Choice | general    | red     | green       | blue      | yellow   | option3 |
    | When is the exam?      | Multiple Choice | 606_course | Monday  | Tuesday     | Wednesday | Thursday | option4 |
    | Who is the professor?  | Multiple Choice | 606_course | Walker  | Chen        | Obama     | Trump    | option1 |
  
Scenario: summary of the test questions
    Given I am on the home page
    Given a valid user
    Then I follow "Sign in"
    Given a loggedin user
    #Then I should see "Signed in successfully."
    Then I should see "You are logged in as"
    Given I am on the index page for test_questions
    When I go to the index page for test_questions
    Then I should see "general"
    And I should see "606_course"
    And I should see "OK"
    When I choose "606_course"
    And I press "OK"
    And I choose "option3" for "answers[2]"
    And I choose "option1" for "answers[3]"
    When I press "Review All"
    Then I press "Submit All"
    Then I should be on the index page for test_questions
    And I follow "Summary"
    Then I should be redirected to the summary page
    
Scenario:Seeing the score
  When I am on the summary page
  Then I should see "You scored"
  And I should see "The questions with the right answers are:"
  And I should not see "What colour is the sky?"
  
Scenario:Going back to the homepage
  When I am on the summary page
  And I follow "Done"
  Then I should be redirected to the sign up page
  
  