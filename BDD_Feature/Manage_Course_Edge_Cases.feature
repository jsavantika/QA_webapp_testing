Feature : Manage courses with some edge cases in content provider database web application

As a user I should be notified if I have left a field blank while creating a course in the Content Provider database

Scenario: Edge Case - Missing Course Name

Given I am on the Content Providers Database Creation page

When I leave the course name field blank

And I enter valid dates for publicised, discontinued 

And I select a valid provider name from the "Provider" dropdown

And I click on the "Create Content" button

Then An error message is displayed asking me the couse name can't be left blank.

Scenario: Edge Case - Missing discontinued Information

Given I am on the Content Providers Database Creation page

When I enter valid course information such as name, publicised date, and provider name

And I leave the discontinued date field blank

And I click on the "Create Content" button

Then An error message is displayed informing me that the discontinued date cannot be left blank.

Scenario: Edge Case - Missing Publicised Information

Given I am on the Content Providers Database Creation page

When I enter valid course information such as name, discontinued date and provider name

And I leave the publicised date field blank

And I click on the "Create Content" button

Then An error message is displayed asking me to enter a publicised date as this field cannot be left blank.