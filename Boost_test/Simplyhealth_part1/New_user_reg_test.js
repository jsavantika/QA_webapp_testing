describe('register new user', () => {
  it('should load the homepage', () => {
    cy.visit('https://www.simplyhealth.co.uk/')
    cy.contains('simplyhealth')
  })
 
  it('users should go to my account to register', () => {
   // Click on "My Account"
    cy.get('body > div.root.responsivegrid > div > div.site-nav.aem-GridColumn.aem-GridColumn--default--12 > header > div.sh-site-header__inner > div > div > a').click();

    // Wait for the page to load
    cy.url().should('include', 'https://www.simplyhealth.co.uk/member-portal');

    // Register new user
    cy.get('button[data-testid="Login_ResendEmail_Button"]').click();

    // Enter email
    cy.get('#email').type('abc@gmail.com');
	// Confirm email
    cy.get('#confirmEmail').type('abc@gmail.com');
	// Enter password
    cy.get('#password').type('randompassword');
	// Confirm password
    cy.get('#confirmPassword').type('randompassword');

    // Click on "Sign In" button
    cy.get('button[data-testid="Register_CreateAccount_Button"]').click();

    // Verify the success message
    cy.get('#root > div > div.UnauthenticatedApp_outer_container__3nNoe > div > div.UnauthenticatedApp_inner_container__jRcfS > div > div > header > h1').should('contain', 'Ok great!');
  });
});



