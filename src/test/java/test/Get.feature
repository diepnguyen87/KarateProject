Feature: Get API demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Get demo 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario: Get demo 2 with background
    Given path "/users?page=2"
    When method GET
    Then status 200

  Scenario: Get demo 3 with path and params
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200

  Scenario: Get demo 4 with match and assert
    Given path "/users"
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name == 'Michael'
    And assert response.data.length == 6
    And match $.data[1].last_name == 'Ferguson'
