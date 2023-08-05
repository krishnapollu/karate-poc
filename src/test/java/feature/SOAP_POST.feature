Feature: SOAP Sample POST

  Background: 
    * url 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'
    * header Content-Type = 'text/xml; charset=utf-8'
    * def path = karate.properties['user.dir']
    * def file = path + '/src/test/resources/payload/post.xml'
    * def body = read('file:' + file)

  Scenario: Sample POST
    Given request body
    When soap action 'NumberToWords'
    Then status 200
    And print response
    And match response /Envelope/Body/NumberToWordsResponse/NumberToWordsResult == 'five hundred'

  Scenario: Sample POST after updating xml file content
    * set body/Envelope/Body/NumberToWords/ubiNum = 300
    Given request body
    When soap action 'NumberToWords'
    Then status 200
    And print response
    And match response /Envelope/Body/NumberToWordsResponse/NumberToWordsResult == 'three hundred'
