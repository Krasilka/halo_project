@api_tests
Feature: API tests

  Background:
    Given I request authorization token for test user

  @modules_list
  Scenario: As an authorized user I can get the list of modules
    When I request the list of modules on page
    Then I get 200 response code
    Then I get non-empty body

  @create_module
  Scenario: As an authorized user I can create new module
    When I send request to create module
    Then I get 200 response code
    When I request the list of modules on page
    Then response should include exact module name

  @delete_module
  Scenario: As an authorized user I can delete module
    Given I send request to create module
    When I send request to delete exact module
    Then I get 200 response code
    When I request the list of modules on page
    Then response should not include exact module name

  @create_duplicated_module
  Scenario: As an authorized user I can not create module with the same name
    Given I send request to create module
    When I send request to create duplicated module
    Then I get 400 response code

