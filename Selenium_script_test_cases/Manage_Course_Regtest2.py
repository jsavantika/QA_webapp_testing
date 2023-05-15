# Script name:		Manage_Course_Regtest2.py
# Date created:		23-03-2023
# Author:			Avantika Sikand
# Description:		This test case is made for regression test when a user tries to read an already present record in the database with appropriate details

# Modification history:	DD-MON-YYYY - First Last 	- Detailed description of change including function name where the change is made
			# No modification done as of now
import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By

class ContentProviderRead(unittest.TestCase):
 
    # Create a new instance of the Chrome driver
    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_create_content_provider(self):
        driver = self.driver
        driver.get("https://content-providers.herokuapp.com/") 
        
        # Find the course with name "1234" in the list as an example
        course_name_element = driver.find_element(By.XPATH, "//td[contains(text(), '1234')]/preceding-sibling::td/a")
        course_name = course_name_element.text

        # Click on the course name in the list
        course_name_element.click()


        # Get the course details from the page
        course_name = driver.find_element(By.id, "content_course_name").text
        publicised_date = driver.find_element(By.id, "content_publicised").text
        discontinued_date = driver.find_element(By.id, "content_discontinued").text
        provider_names = driver.find_element(By.id, "content_provider").text
        
        course_name_details = course_name.get_attribute("value")
        publicised_date_details = publicised_date.get_attribute("value")
        discontinued_date_details = discontinued_date.get_attribute("value")
        provider_name_details = provider_names.get_attribute("value")
        
        # Verify that the course details are not empty
        self.assertTrue(course_name_details != "")
        self.assertTrue(publicised_date_details != "")
        self.assertTrue(discontinued_date_details != "")
        self.assertTrue(provider_name_details != "")
        
     def tearDown(self):
        self.driver.quit(
        
if __name__ == '__main__':
    unittest.main()