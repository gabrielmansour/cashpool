Feature: Groups
  In order to form a pool
  As a user
  I want to be able to create a group

  Background:
    Given I am signed in

  Scenario: Add a group
    When I go to the new group page
    And I enter a name
    And I press "Submit"
    Then the group should exist


  Scenario: Invite a person to a group
    Given a group exists
    When I invite a friend to the group
    Then my friend should be on the pending user list

  Scenario: Friend accepts the invitation
    Given a group exists
    And a friend has been invited
    When my friend accepts the invitation
    Then he should be a member of the group
    And he should not be on the pending user list


