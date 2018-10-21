Feature: modify an existing question
  
  As an admin
  So that I can update a question in the database
  I want to add a new question
  
  Background: questions in database
 
  Given the following questions exist:
  | qtype             | topic  | content       | option1 | option2 | option3 | option4 | answer  |  explanation |
  | Multiple Choice   | topic1 | Question 1    | opt1    | opt2    | opt3    | opt4    | option1 |  exp1        |
  | Multiple Choice   | topic1 | Question 2    | opt1    | opt2    | opt3    | opt4    | option2 |  exp2        |
  | Multiple Choice   | topic2 | Question 3    | opt1    | opt2    | opt3    | opt4    | option4 |  exp3        |
  
  Scenario: path of editing an existing question
  When I am on the homepage
  And I follow "Edit" of "1"
  Then I should be redirected to Edit Question Page of "1"
  
  Scenario: destroying an existing question
  When I am on the homepage
  And I follow "Destroy" of "1"
  Then I should be redirected to the homepage
  And "Question 1" should not be in the Question List
  
  Scenario: updating a mcq question to a tf question
    When I am on the homepage
    And I follow "Edit" of "1"
    And I select "True or False" from "question_qtype"
    And I press "Update Question"
    Then I should see "nil"
    And I should not see "option3"
    And I should not see "option4"
    And I should not see "opt1"
    And I should not see "opt2"
    And I should see "True"
    And I should see "False"
    
  Scenario: updating topic of a mcq question
    When I am on the homepage
    And I follow "Edit" of "1"
    And I select "True or False" from "question_qtype"
    And I fill in "question_topic" with "general"
    And I press "Update Question"
    Then I should see "general"
    And I should see "True or False"
    
  Scenario: updating a tf question to a mcq question
    When I am on the homepage
    And I follow "Edit" of "1"
    And I select "Multiple Choice" from "question_qtype"
    And I press "Update Question"
    Then I should see "Question was successfully updated."
    And I should be redirected to "Show" of "1"
    
  Scenario: updating invalid question
    When I am on the homepage
    And I follow "Edit" of "1"
    And I select "Multiple Choice" from "question_qtype"
    And I fill in "question_content" with ""
    And I press "Update Question"
    Then I should not see "Question was successfully updated."
    And I should be redirected to "Edit" of "1"