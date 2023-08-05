Feature: POST Samples

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Simple POST
    Given path '/users'
    And request {"name": "iUser", "job": "coder"}
    When method POST
    Then status 201
    And print response
    And match $.id == '#string'

  Scenario: Simple POST with payload from file
    * def path = karate.properties['user.dir']
    * def file = path + '/src/test/resources/payload/post.json'
    * def body = read('file:' + file)
    * set body.job = 'developer'
    Given path '/users'
    And request body
    When method POST
    Then status 201
    And print response
    And match $.id == '#string'
