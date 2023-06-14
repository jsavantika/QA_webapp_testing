describe('login user', () => {
  it('should load the homepage', () => {
    cy.visit('https://www.simplyhealth.co.uk/')
    cy.contains('simplyhealth')
  })
 
  it('users should go to my account to sign in', () => {
   // Click on "My Account"
    cy.get('body > div.root.responsivegrid > div > div.site-nav.aem-GridColumn.aem-GridColumn--default--12 > header > div.sh-site-header__inner > div > div > a').click();

    // Wait for the page to load
    cy.url().should('include', 'https://www.simplyhealth.co.uk/member-portal');

    // Enter email
    cy.get('#email').type('abc@gmail.com');
	// Enter password
    cy.get('#password').type('randompassword');
	
    // Click on "Sign In" button
    cy.get('button[data-testid="Login_SignIn_Button"]').click();

    });
});



