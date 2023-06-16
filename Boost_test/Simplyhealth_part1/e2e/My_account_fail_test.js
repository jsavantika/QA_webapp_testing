import login from '../selectors/myaccount.sel'

describe('login functionality', () => {
  before(() => {
    cy.visit('/member-portal');
  });
//incorrect login 
  it('users should go to my account to login', () => {
   
    // Wait for the page to load
    cy.intercept('**/member-portal').as('memberPortalRequest');
	cy.visit('https://www.simplyhealth.co.uk/');
	cy.wait('@memberPortalRequest');
	cy.url().should('include', 'https://www.simplyhealth.co.uk/member-portal');

    // Enter email
    cy.get('login.emailField').type('abc@gmail.com');

    // Enter password
    cy.get('login.passwordField').type('randompassword');

    // Click on "Sign In" button
    cy.get('login.signInButton').click();

    // Verify the error message
    cy.get('login.errormessages').should('contain', 'Incorrect username or password.');
  });
});
