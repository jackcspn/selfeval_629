Feature:Show the content of existing  questions in the Question List Page
  
  As an admin
  So that I can see content of the existing Question completely 
  I want to show the existing question
 
 Background: questions in database
 
  Given the following questions exist:
  |  qtype  | topic  | content      | option1 | option2      | option3      | option4    | answer  |  explanation |
  |  MCQ    | topic1 | Question 1   | PG      | George Lucas |  Shane Cooper|  Watson    | option4 |  exp1        |
  |  MCQ    | topic2 | Question 2   | PG      | Ridley Scott |  Sean Parker |  Tesla     | option3 |  exp2        |
  |  T/F    | topic3 | Question 3   | True    | False        |  nil         |  nil       | option1 |  exp3        |
  |  T/F    | topic1 | Question 4   | True    | False        |  nil         |  nil       | option2 |  exp4        |
  
  Scenario: showing the content of the existing question
  When I am on the Question List Page
  And I follow "Show" of "1"
  Then the content of "1" should be "Question 1"
  
  Scenario: redirecting to edit the content of the existing question
  When I am on the content declaration page of "1"
  And I follow "Edit" of "1"
  Then I should be redirected to the edit page of "1"
  
#Scenario:updating question successful after editing
 # When I am on the edit page of "1"
 # And I follow "Update Question" of "1"
 # Then I should be redirected to the content declaration page of "1"
 # And the content of "1" should be the updated content
  