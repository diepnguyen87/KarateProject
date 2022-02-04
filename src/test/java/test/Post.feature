Feature: Post API demo

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedResponse = read('ExpectedResponse.json')

  Scenario: Post demo 1
    Given path '/users'
    And request {"name": "morpheus", "job": "leader"}
    When method POST
    Then status 201
    And print response

  Scenario: Post demo 2 with assertion
    Given path '/users'
    And request {"name": "morpheus", "job": "leader"}
    When method POST
    Then status 201
    And match response == {"name": "morpheus","job": "leader","id": "#string","createdAt": "#ignore"}

  Scenario: Post demo 3 with asertion get expected response from file
    Given path '/users'
    And request {"name": "morpheus", "job": "leader"}
    When method POST
    Then status 201
    And match response == expectedResponse
    And print response

  Scenario: Post demo 4 with get body from file
    Given path '/users'
    And def requestBody = read('RequestBody.json')
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedResponse
    And print response

  Scenario: Post demo 5 with get body from file
    Given path '/users'
    And def projectPath = karate.properties["user.dir"]
    And def filePath = projectPath + '/src/test/java/data/RequestBody.json'
    And def requestBody = filePath
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedResponse
    And print response

  Scenario: Post demo 5 with get body from file
    Given path '/users'
    And def requestBody = read('RequestBody.json')
    And set requestBody.job = 'Automation'
    And request requestBody
    When method POST
    Then status 201
    And match $ == expectedResponse
    And print response
