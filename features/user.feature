Feature: User
  Scenario: Log in
    Given I am on the home page
    And I am signed in to Facebook
    When I click the login link
    Then I should be signed in
    
  Scenario: Log out
    Given I am signed in
    And I am on the home page
    When I click the logout link
    Then I should not be signed in

