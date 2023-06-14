describe('login functionality', () => {
  it('should load the homepage', () => {
    cy.visit('https://www.simplyhealth.co.uk/')
    cy.contains('simplyhealth')
  })
//incorrect login 
  it('users should go to my account to login', () => {
   // Click on "My Account"
    cy.get('body > div.root.responsivegrid > div > div.site-nav.aem-GridColumn.aem-GridColumn--default--12 > header > div.sh-site-header__inner > div > div > a').click();

    // Wait for the page to load
    cy.url().should('include', 'https://www.simplyhealth.co.uk/member-portal');

    // Enter email
    cy.get('#email').type('abc@gmail.com');

    // Enter password
    cy.get('#password').type('randompassword');

    // Click on "Sign In" button
    cy.get('#root > div > div > div > div > div:nth-child(2) > div > div > div.SignIn_form_container__66REl > div:nth-child(2) > div.SignIn_submit_button_wrapper__3nl6v > button').click();

    // Verify the error message
    cy.get('#root > div > div > div > div > div:nth-child(2) > div > div > div.SignIn_form_container__66REl > div:nth-child(2) > div.SignIn_error_message_wrapper__Fcwdh > div > div > p').should('contain', 'Incorrect username or password.');
  });
});
