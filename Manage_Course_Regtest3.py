# Script name:		Manage_Course_Regtest1.py
# Date created:		23-03-2023
# Author:			Avantika Sikand
# Description:		This test case is made for regression test when a user tries to delete an old record. This tests the delete functionality of application
# Modification history:	DD-MON-YYYY - First Last 	- Detailed description of change including function name where the change is made
			# No modification done as of now
            
import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class ContentProviderDeletion(unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Chrome()
        
    def tearDown(self):
        self.driver.quit()

    def test_delete_course(self):
        # Given I am on the Course List page
        self.driver.get("https://content-providers.herokuapp.com/")

        # When I click on the course name in the list
        course_link = self.driver.find_element_by_link_text("25991")
        course_link.click()

        # Then I click on the "Delete" button next to a course
        driver.find_element_by_xpath("//button[text()='Delete']").click()
        
        # Then The message is displayed "Content was successfully destroyed." along with redirection to home page
        home_link = self.driver.find_element_by_xpath("//a[@href='/contents']")
        home_link.click()
        self.assertEqual(self.driver.current_url, "https://content-providers.herokuapp.com//")
        self.assertIn("Content was successfully destroyed.", driver.page_source)

        # And the list should be sorted alphabetically by course name
        course_names = [c.text for c in driver.find_elements_by_xpath("//th[1]")]
        self.assertListEqual(course_names, sorted(course_names))

        # And the list displays 10 results per page
        results_per_page = table_body.find_all('tr')[1:]
        if len(rows)<=10:
            self.assertEqual(results_per_page.text)

        pagination_controls = driver.find_element_by_class("pagination justify-content-center")
        self.assertIsNotNone(pagination_controls)

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()
