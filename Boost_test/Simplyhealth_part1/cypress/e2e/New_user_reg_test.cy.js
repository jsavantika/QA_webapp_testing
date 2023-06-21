import login from '../selectors/register.sel'

describe('register new user', () => {
  before(() => {
    cy.visit('/member-portal');
  });
 
  it('users should go to my account to register', () => {
 
    // Wait for the page to load
    cy.intercept('**/member-portal').as('memberPortalRequest');
	cy.visit('https://www.simplyhealth.co.uk/');
	cy.wait('@memberPortalRequest');
	cy.url().should('include', 'https://www.simplyhealth.co.uk/member-portal');

    // Register new user
    cy.get('register.registerButton').click();

    // Enter email
    cy.get('register.emailField').type('abc@gmail.com');
	// Confirm email
    cy.get('register.confirm_email').type('abc@gmail.com');
	// Enter password
    cy.get('register.passwordField').type('randompassword');
	// Confirm password
    cy.get('register.confirmpasswordField').type('randompassword');

    // Click on "Register" button
    cy.get('register.registerButton2').click();

    // Verify the success message
    cy.get('register.successMessages').should('contain', 'Ok great!');
  });
});



