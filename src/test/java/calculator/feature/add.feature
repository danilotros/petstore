Feature: Add function in calculator

  Scenario: Add two numbers
    Given url urlBase
    * def numeroUno = 1
    * def numeroDos = 2
    * def requestXml = read('classpath:calculator/xml/add.xml')
    And request requestXml
    And header Content-Type = 'text/xml; charset=utf-8'
    When method post
    Then status 200
    And def respuesta = /Envelope/Body/AddResponse/AddResult
    And match /Envelope/Body/AddResponse/AddResult == '3'
    And print 'respuesta: ', respuesta
