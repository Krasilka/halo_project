@ui_tests
Feature: Content modules: user can create, remove and modify modules

  Background:
    Given I am logged in
    When I go to content page

  @create_new_module
  Scenario: As a logged in User I can create new module
    And I create new module
    Then I should see module in the list

  @delete_module
  Scenario: As a logged in User I can delete module
    And I create new module
    Then I should see module in the list
    When I delete created module
    Then I should not see module in the list

  @search_module
  Scenario: As a logged in User I can search for module
    And I create new module
    When I search for newly created module
    Then I should see module in the list

  @duplicate_module
  Scenario: As a logged in User I can't create module with existing name
    When I create module with name "Test Relations"
    Then I should see error message "You cannot create a module with the same name"


