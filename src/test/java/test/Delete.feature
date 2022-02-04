Feature: Delete API demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    
  Scenario: Delete demo
    Given path '/users/2'
    When method DELETE
    Then status 204
    And print response