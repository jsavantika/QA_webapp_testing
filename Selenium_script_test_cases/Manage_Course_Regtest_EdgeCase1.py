# Script name:		Manage_Course_regtest_EdgeCase1.py
# Date created:		23-03-2023
# Author:			Avantika Sikand
# Description:		This test case is made to test an edge case when a user tries to create a record with blank course name

# Modification history:	DD-MON-YYYY - First Last 	- Detailed description of change including function name where the change is made
			# No modification done as of now
import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class ContentProvidersMissing(unittest.TestCase):
    
    def setUp(self):
        self.driver = webdriver.Chrome()
        
    def test_missing_course_name(self):
        # Go to the Content Providers Database Creation page
        self.driver.get("https://content-providers.herokuapp.com/contents/new")
        
        # Leave the course name field blank
        self.driver.find_element_by_name("content[course_name]").send_keys("")
        
        # Enter valid dates for publicised, discontinued
        self.driver.find_element_by_name("content[publicised_on]").send_keys("05/01/2019")
        self.driver.find_element_by_name("content[discontinued_on]").send_keys("11/04/2021")
        
        # Select a valid provider name from the "Provider" dropdown
        dropdown = self.driver.find_element_by_name("content[provider_id]")
        dropdown.find_element_by_xpath("//option[text()='LinkedIn']").click()
        
        # Click on the "Create Content" button
        self.driver.find_element_by_name("commit").click()
        
        # Check if an error message is displayed asking for the course name
        error_message = self.driver.find_element_by_css_selector(".error")
        self.assertIn("Course name can't be blank",error_message.text)
        
    def tearDown(self):
        self.driver.quit()
        
if __name__ == '__main__':
    unittest.main()
