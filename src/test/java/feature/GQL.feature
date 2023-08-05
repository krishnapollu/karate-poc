Feature: Sample GQL

  Background: 
    * url 'https://countries.trevorblades.com/'
    * def path = karate.properties['user.dir']

  Scenario: Sample GQL Request
    * def file = path + '/src/test/resources/payload/post.graphql'
    * def body = read('file:' + file)
    Given path '/'
    And request {query: #(body)}
    When method POST
    Then status 200
    And print response
    And match response.data.country.name == 'Brazil'

  Scenario: Sample GQL Request with updated query
    * def file = path + '/src/test/resources/payload/post2.graphql'
    * def body = read('file:' + file)
    Given path '/'
    * replace body.id = 'IN'
    And request { query: '#(body)' }
    When method POST
    Then status 200
    And print response
    And match response.data.country.name == 'India'
