# Script name:		Manage_Course_Regtest1.py
# Date created:		23-03-2023
# Author:			Avantika Sikand
# Description:		This test case is made for regression test when a user tries to create a new record with appropriate details

# Modification history:	DD-MON-YYYY - First Last 	- Detailed description of change including function name where the change is made
			# No modification done as of now
            
import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class ContentProviderCreation(unittest.TestCase):
    #Create new instance of chrome driver
    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_create_content_provider(self):
        driver = self.driver
        driver.get("https://content-providers.herokuapp.com/contents/new")

        # Enter valid course information with course name, publicised date, discontinued date and select provider from the given list
        course_name = driver.find_element_by_xpath("//input[@id='content_course_name']")
        course_name.send_keys("1234")
        
        publicised_date = driver.find_element_by_xpath("//input[@id='content_publicise']")
        publicised_date.send_keys("02/06/2022")

        discontinued_date = driver.find_element_by_xpath("//input[@id='content_discontinued']")
        discontinued_date.send_keys("06/01/2022")
        
        # Select a valid provider from the dropdown
        provider_dropdown = driver.find_element_by_id("content_provider")
        provider_dropdown.select_by_visible_text("Udemy")

        # Click on the "Create Content" button
        create_button = driver.find_element_by_name("commit")
        create_button.click()

        # Verify that content is successfully created and redirected to course list page
        self.assertEqual(driver.current_url, "https://content-providers.herokuapp.com/")
        create_msg= driver.find_element_by_xpath("//div/div[1]">
        self.assertequal(create_msg, "Content was successfully created.")
        
        # Verify that the newly created course is listed
        links = driver.find_elements_by_tag_name('a')
        # Iterate through each link and click on the one that contains the match
        partial_match = '1234'
        if partial_match in links:
             self.assertEqual(links.text)
        else:
            for link in links:
                link.click()
                match = driver.find_element_by_partial_link_text('1234')
                if partial_match in match:
                    self.assertEqual(links.text)
                    break
        
        # Verify that the list is sorted alphabetically by course name
        course_names = [c.text for c in driver.find_elements_by_xpath("//th[1]")]
        self.assertListEqual(course_names, sorted(course_names))

        # Verify that the list displays 10 results per page and pagination controls are displayed
        results_per_page = table_body.find_all('tr')[1:]
        if len(rows)<=10:
            self.assertEqual(results_per_page.text)

        pagination_controls = driver.find_element_by_class("pagination justify-content-center")
        self.assertIsNotNone(pagination_controls)

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()

