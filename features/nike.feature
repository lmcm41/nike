Feature: Buy an item

  Scenario: Login on Nike
    Given I am on the Nike site
    When I enter to the login page
    And Enter the my credentials
    Then I should be logged in with the name "My Account"

  Scenario: Search for an item
    Given I am on the Nike site
    When I search for "Bags"
    And Select an item from the results
    Then I should be on the information page of the selected item