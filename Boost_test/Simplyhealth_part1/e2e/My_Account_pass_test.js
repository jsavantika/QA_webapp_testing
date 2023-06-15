import login from '../selectors/login.sel'

describe('login user', () => {
  beforeEach(() => {
    cy.visit('/member-portal');
  });
  it('users should go to my account to sign in', () => {
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

    });
});



