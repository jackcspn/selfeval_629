Feature: include formatted equations
  
  As a student or an admin
  So that I can better understand math equations
  I want equations to appear similar to how they would be written
  
  Background: questions in database
    
    Given the following questions exist:
    | content                      | qtype            | option1 | option2     | option3         | option4  | answer  | topic |
    | What color is the sky?       | Multiple Choice  | red     | green       | blue            | yellow   | option3 | general |
    | What is \(\frac{1+2^2}{5}\)? | Multiple Choice  | 5       | 1           | \(\frac{1}{3}\) | 0        | option2 | general |
    | Who is the professor?        | Multiple Choice  | Walker  | Chen        | Obama           | Trump    | option1 | general |

  Scenario: view equations in the test
    Given I am on the home page
    Given a valid user
    Then I follow "Sign in"
    Given a loggedin user
    #Then I should see "Signed in successfully."
    Then I should see "You are logged in as"
    When I go to the index page for test_questions
    And I choose "general"
    And I press "OK"
    Then show me the page
    And I choose "option3" for "answers[2]"
    And I choose "option1" for "answers[3]"
    When I press "Review All"
    Then I press "Submit All"
    Then I should be on the index page for test_questions
    And I follow "Summary"
    Then I should be redirected to the summary page
    And show me the page
  
  Scenario: view equations in the questions index
    When I am viewing the questions index
    Then show me the page