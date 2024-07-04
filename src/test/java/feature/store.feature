Feature: Pet Store
  Background:
    * def urlBase = 'https://petstore.swagger.io/v2/'
    * def idMascota = 1
    * def requestPayload = read('classpath:payload/petrequest.json')

  Scenario Outline: Añadir Mascota a la tienda
  Given url urlBase + 'pet'
  * set requestPayload.id = Java.type('snippets.GenerarDatos').generarNumeroMascota()
  * set requestPayload.category.id = <categoryId>
  * set requestPayload.category.name = <categoryName>
  * set requestPayload.name = <name>
  * set requestPayload.photoUrls[0] = <photoUrl>
  * set requestPayload.tags[0].id = <tagId>
  * set requestPayload.tags[0].name  = <tagName>
  * set requestPayload.status = <status>
  And request requestPayload
  When method post
  Then  status 200
  * print response
    Examples:
      | categoryId | categoryName | name     | photoUrl                  | tagId | tagName | status      |
      | 1          | "Dogs"       | "doggie" | "https://www.google.com/" | 12    | "Tag"   | "available" |


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

