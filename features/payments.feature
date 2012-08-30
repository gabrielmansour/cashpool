Feature: Payments
  In order to pay for the rehearsal
  As a group manager
  I want to collect money from other members

  Background:
    Given I am signed in

  Scenario: Group money request
    Given a group exists
    When the group manager asks the group for $40
    Then then the group debt should be increased by $40

  Scenario: Group money request: group with members
    Given a group exists
    And the group's debt is $40
    And the group has 8 members
    Then the members should owe an equal amount of money to the group
    #And every group member should be notified of the money request

  Scenario: Group member submits a payment
    Given a user owes money to a group
    When the user makes a payment to the group
    Then the user's debt to the group decreases by the amount paid
    And the group's debt is decreased by the amount paid
    And I should see that the user made a payment to the group

