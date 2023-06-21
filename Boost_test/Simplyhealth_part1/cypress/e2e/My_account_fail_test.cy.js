import login from '../selectors/login.sel'

describe('login functionality', () => {
  Cypress.on('uncaught:exception', (err, runnable) => {
    // returning false here prevents Cypress from
    // failing the test
    debugger;
    return false
})
  beforeEach(() => {
    cy.visit('/member-portal');
    cy.get('#onetrust-accept-btn-handler:visible').click()
  });
  require("cypress-xpath")
//incorrect login 
  it('users should go to my account to login', () => {
   
    // Wait for the page to load
    cy.intercept('**/member-portal').as('memberPortalRequest');
		cy.url().should('include', 'https://www.simplyhealth.co.uk/member-portal');

    // Enter email
    cy.get(login.emailField).type('abc@gmail.com');

    // Enter password
    cy.get(login.passwordField).type('randompassword');

    // Click on "Sign In" button
    cy.get(login.signInButton).click();

    // Verify the error message
    cy.get(login.errorMessages).should('have.text',"Error: Incorrect username or password.");
  });
});
