describe('Jungle Rails Add to Cart', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  })

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  })

  it("adds the product in the cart when you click add button", () => {
    cy.get(".products article").first()
    cy.contains('Add').click({ force: true })

    cy.contains('My Cart').should('have.text', 'My Cart (1)')
  })

})