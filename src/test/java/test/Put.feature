Feature: Put API demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def updatedBody = read('UpdateBody.json')
    
  Scenario: Put demo
    Given path '/users/2'
    And request updatedBody
    When method PUT
    Then status 200
    And print response