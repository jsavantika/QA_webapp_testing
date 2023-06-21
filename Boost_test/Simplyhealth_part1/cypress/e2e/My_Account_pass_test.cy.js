import login from '../selectors/login.sel'

describe('login user', () => {
  Cypress.on('uncaught:exception', (err, runnable) => {
    // returning false here prevents Cypress from
    // failing the test
    return false
})
  beforeEach(() => {
    cy.visit('/member-portal');
    cy.get('#onetrust-accept-btn-handler:visible').click()
  });
  it('users should go to my account to sign in', () => {
    // Wait for the page to load
    cy.intercept('**/member-portal').as('memberPortalRequest');
		cy.url().should('include', 'https://www.simplyhealth.co.uk/member-portal');

    // Enter email
    cy.get(login.emailField).type('abc@gmail.com');
	// Enter password
    cy.get(login.passwordField).type('randompassword');
	
    // Click on "Sign In" button
    cy.get(login.signInButton).click();

    });
});



