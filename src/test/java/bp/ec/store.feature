Feature: Pet Store
  Background:
    * def urlBase = 'https://petstore.swagger.io/v2/'
    * def idMascota = 12

  Scenario: Añadir Mascota a la tienda
  Given url urlBase + 'pet'
  And request {"id": '#(idMascota)',"category": {"id": 0,"name": "string"},"name": "Titan","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
  When method post
  Then  status 200

  Scenario:Consultar la mascota ingresada previamente
  Given url urlBase + 'pet/'+idMascota
  When method get
  Then  status 200

  Scenario: Actualizar el nombre de la mascota y el estatus de la mascota a sold
    Given url urlBase + 'pet'
    And request {"id": '#(idMascota)',"category": {"id": 0,"name": "string"},"name": "Titan","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "sold"}
    When method put
    Then  status 200

  Scenario:Consultar la mascota ingresada previamente
    Given url urlBase + 'pet/findByStatus?status=sold'
    When method get
    Then  status 200
    * def elemento = {"id": '#(idMascota)',"category": {"id": 0,"name": "string"},"name": "Titan","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "sold"}
    Then match response contains elemento

