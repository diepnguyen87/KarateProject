Feature: sample API test

  Scenario: Test a sample GET api
    Given url "https://reqres.in/api/users?page=2"
    When method GET
    Then status 200
