Feature: Manage Courses with CRUD operations on Chrome browser

As a user of the Content Provider Database web application, I want to be able to create, read, update, and delete courses.

Scenario: Create a Content Provider

Given I am on the Content Providers Database Creation page and have admin priviledge

When I enter valid course information such as name, publicised date and discontinued date 

And I select a valid provider name from the "Provider" dropdown

And I click on the "Create Content" button

Then The content is successfully created and I am redirected to the course list page where I can see the newly created course listed.

And the list should be sorted alphabetically by course name

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers new content add page
# New provider should be listed on the page with the details provided
# Success message should be displayed indicating that the provider was created successfully


Scenario: Read a Course

Given I am on the Course List page and have admin priviledge

When I click on a course name in the list

Then The details of the selected course, including its name, publicised date, discontinued date and Provider name are displayed on the Course Details page.

# Expected Result:

# User should be redirected to the Content Providers page
# The provider should be listed on the page with the all details

Scenario: Update a Course

Given I am on the Course List page and have admin priviledge

When I click on a course name in the list

Then I update the course name or any other course details

And I click on the "Update Content" button

Then The course details are updated and the Course List page is displayed with the updated course details.

And the list should be sorted alphabetically by course name

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expected Result:

# User should be redirected to the Content Providers page
# The updated provider should be listed on the page with the updated details
# Success message should be displayed indicating that the provider was updated successfully

Scenario: Delete a Course

Given I am on the Course List page and have admin priviledge

When I click on the course name in the list 

Then I click on the "Delete" button next to a course 

Then The message is displayed "Content was successfully destroyed." 

And the course list page is displayed with all existing courses 

And the list should be sorted alphabetically by course name

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers page
# Deleted provider should not be listed on the page 
# Success message should be displayed indicating that the provider was deleted successfully

#As a user I should be notified if I have left a field blank while creating a course in the Content Provider database

Scenario: Edge Case - Missing Course Name

Given I am on the Content Providers Database Creation page and have admin priviledge

When I leave the course name field blank

And I enter valid dates for publicised, discontinued 

And I select a valid provider name from the "Provider" dropdown

And I click on the "Create Content" button

Then An error message is displayed asking me the couse name can't be left blank.

# Expected Results:

# User should be redirected to the Content Providers page
# Error message should be displayed indicating that the course name should not be left blank

Scenario: Edge Case - Missing discontinued Information

Given I am on the Content Providers Database Creation page and have admin priviledge

When I enter valid course information such as name, publicised date, and provider name

And I leave the discontinued date field blank

And I click on the "Create Content" button

Then An error message is displayed informing me that the discontinued date cannot be left blank.

# Expected Results:

# User should be redirected to the Content Providers page
# Error message should be displayed indicating that the discontinued field should not be left blank

Scenario: Edge Case - Missing Publicised Information

Given I am on the Content Providers Database Creation page and have admin priviledge

When I enter valid course information such as name, discontinued date and provider name

And I leave the publicised date field blank

And I click on the "Create Content" button

Then An error message is displayed asking me to enter a publicised date as this field cannot be left blank.

# Expected Results:

# User should be redirected to the Content Providers page
# Error message should be displayed indicating that the publicised field should not be left blank

#As a user I should be notified if I am entering a publicised date which falls after the discontinued date so that I can correct it and create the course

Scenario: Edge Case - Publicised Date after Discontinued Date

Given I am on the Content Providers Database Creation page and have admin priviledge

When I enter valid course information such as name, publicised date after discontinued date

And I select a valid provider name from the "Provider" dropdown

And I click on the "Create Content" button

Then An error message is displayed informing me that the publicised date cannot be after the discontinued date.

# Expected Results:

# User should be redirected to the Content Providers page
# Error message should be displayed indicating that the publicised date cannot be after the discontinued date

#As a user of the Content Provider database web application, I want to be able to search for courses by name and get all the information irrespective of any case sensitivity.

Scenario: Edge Case - Search for an Invalid Course Name

Given I am on the Course List page with admin priviledge

When I enter a course name in the search box which is not present in the database

And I click on the "Search" button

Then The search box is cleared and the course list is displayed with no courses.

#Expected Results:

# User should be redirected to the Content Providers page with no results

Scenario: Edge Case -  Create a Course That Already Exists

Given I am on the Course List page with admin priviledge

And There is already a course named "java1" in the database

When I click on the "Add Content Provider" button

And I enter "java1" in the "Course Name" field

And I enter valid dates for "Publicised Date" and "Discontinued Date"

And I select a valid provider name from the "Provider" dropdown

And I click on the "Create Content" button

Then The content is successfully created and I am redirected to the course list page where I can see the newly created course listed.

And the list should be sorted alphabetically by course name

And the existing course with same name in the database should not be affected

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers page
# New provider should be listed on the page with the details provided
# Success message should be displayed indicating that the provider was created successfully

Scenario: Edge Case -Create a Course and Provider With Existing Name but Different Dates

Given I am on the Course List page with admin priviledge

And There is already a course named "java1" and provider "Udemy" with different "Publicised Date" and "Discontinued Date" in the database

When I click on the "Add Content Provider" button

And I enter "java1" in the "Course Name" field

And I enter valid dates for "Publicised Date" and "Discontinued Date" that are different from the existing course

And I select a provider name from the "Provider" dropdown that is same as the existing provider for the existing course

And I click on the "Create Content" button

Then The content is successfully created and I am redirected to the course list page where I can see the newly created course listed.

And the list should be sorted alphabetically by course name

And the existing course with same course name and provider name in the database should not be affected

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers page
# New provider should be listed on the page with the details provided
# Success message should be displayed indicating that the provider was created successfully

#As a user of the Content Providers database web application, I want to be able to search for courses based on a word in the search option, without being case sensitive.

Scenario: Edge Case -Display Courses That Are Similar To the Word In The Search Option, Without Being Case Sensitive

Given I am on the Course List page with admin priviledge

And There are multiple courses with different names in the database

When I enter a partial course name in the search bar, such as "In" without being case-sensitive

And I click on the "Search" button

Then The course list is updated and only displays the courses whose names match the search criteria

And The search result only includes courses whose name contain "In" in the course name regardless of case sensitivity

And The search result is displayed in a table format with the "Course Name", "Publicised", "Discontinued", and "Provider" columns.

And The search result includes all courses whose name contain "In" in any case format, regardless of the provider name, publicised and discontinued dates.

And the list should be sorted alphabetically by course name

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers page
# All provider should be listed on the page which contain the name in their course name

#As a user Display list of all courses on content provider's web app

Scenario: Edge Case -View list of all courses when search is left blank
    
Given I am on the Course List page of the content provider's web application with admin priviledge

When I click on the search button without entering anything in the search box

Then the course list should be displayed with the "Course Name", "Publicised", "Discontinued" and "Provider" details

And the list should be sorted alphabetically by course name

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers page
# All provider should be listed on the page

Scenario: Edge Case -Create a content provider with same date for publicised and discontinued fields

Given I am on the Content Providers Database Creation page  with admin priviledge

When I enter valid course information such as name

And I select valid option for Provider name from the dropdown

And I enter the same date for the publicised and discontinued fields

And I click on the "Create Content" button

Then The content is successfully created and I am redirected to the course list page where I can see the newly created course listed.

And the list should be sorted alphabetically by course name

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers new content add page
# New provider should be listed on the page with the details provided
# Success message should be displayed indicating that the provider was created successfully

Scenario: Edge Case -Create a content provider with incorrect year format for "Publicised" and "Discontinued" fields

Given I am on the Content Providers Database Creation page with admin priviledge

When I enter valid course information such as name

And I select valid option for Provider name from the dropdown

And I enter the date format 01/01/000352 instead of 02/11/2022 for the publicised and discontinued fields

And I click on the "Create Content" button

Then The content is successfully created and I am redirected to the course list page where I can see the newly created course listed.

And the list should be sorted alphabetically by course name

And the list displays 10 results per page

And there are more than 10 content providers in the database

Then the pagination controls are displayed

And the user is able to navigate between the pages to view all the content providers

# Expedted results: 

# User should be redirected to the Content Providers new content add page
# New provider should be listed on the page with the details provided
# Success message should be displayed indicating that the provider was created successfully
