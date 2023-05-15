Feature: Manage Courses

As a user of the Content Provider Database web application, I want to be able to create, read, update, and delete courses.

Scenario: Create a Content Provider

Given I am on the Content Providers Database Creation page

When I enter valid course information such as name, publicised date and discontinued date 

And I select a valid provider name from the "Provider" dropdown

And I click on the "Create Content" button

Then The content is successfully created and I am redirected to the course list page where I can see the newly created course listed.

And the list should be sorted alphabetically by course name

Scenario: Read a Course

Given I am on the Course List page

When I click on a course name in the list

Then The details of the selected course, including its name, publicised date, discontinued date and Provider name are displayed on the Course Details page.

And the list should be sorted alphabetically by course name

Scenario: Update a Course

Given I am on the Course List page

When I click on a course name in the list

Then I update the course name or any other course details

And I click on the "Update Content" button

Then The course details are updated and the Course List page is displayed with the updated course details.

And the list should be sorted alphabetically by course name

Scenario: Delete a Course

Given I am on the Course List page

When I click on the course name in the list 

Then I click on the "Delete" button next to a course 

Then The message is displayed "Content was successfully destroyed." 

And the course list page is displayed with all existing courses 

And the list should be sorted alphabetically by course name