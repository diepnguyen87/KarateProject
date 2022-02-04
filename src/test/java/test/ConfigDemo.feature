Feature: Get variable from config file

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Config demo
    Given print name

  Scenario: Get demo 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
  
