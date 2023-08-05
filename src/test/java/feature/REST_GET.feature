Feature: GET Samples

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Simple GET
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response

  Scenario: Simple GET with background
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200

  Scenario: Simple GET with background and validate response
    Given path '/users/2'
    When method GET
    Then status 200
    * def id = response.data.id
    And print 'id is ' + id
    And match response.data.id == 3
