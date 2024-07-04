Feature: Pet Store
  Background:

    * def requestPayload = read('classpath:petstore/payload/petrequest.json')
    * print urlBase
    * print microsoftTokenAuth

  @primero
  Scenario Outline: Añadir Mascota a la tienda
  Given url urlBase + 'pet'
  * def idMascota = Java.type('snippets.GenerarDatos').generarNumeroMascota()
  * karate.set('idMascota', idMascota)
  * set requestPayload.id = idMascota
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
  * def result = call read('classpath:petstore/feature/store.feature@primero')
  Given url urlBase + 'pet/'+result.idMascota
  When method get
  Then  status 200


  Scenario Outline: Actualizar el nombre de la mascota y el estatus de la mascota a sold
    * def result = call read('classpath:petstore/feature/store.feature@primero')
    Given url urlBase + 'pet'
    * set requestPayload.id = result.idMascota
    * set requestPayload.category.id = <categoryId>
    * set requestPayload.category.name = <categoryName>
    * set requestPayload.name = <name>
    * set requestPayload.photoUrls[0] = <photoUrl>
    * set requestPayload.tags[0].id = <tagId>
    * set requestPayload.tags[0].name  = <tagName>
    * set requestPayload.status = <status>
    And request requestPayload
    When method put
    Then  status 200
    Examples:
      | categoryId | categoryName | name     | photoUrl                  | tagId | tagName | status |
      | 1          | "Dogs"       | "doggie" | "https://www.google.com/" | 12    | "Tag"   | "sold" |

  Scenario Outline:Consultar la mascota ingresada previamente
    Given url urlBase + 'pet/findByStatus?status=sold'
    * set requestPayload.id = <id>
    * set requestPayload.category.id = <categoryId>
    * set requestPayload.category.name = <categoryName>
    * set requestPayload.name = <name>
    * set requestPayload.photoUrls[0] = <photoUrl>
    * set requestPayload.tags[0].id = <tagId>
    * set requestPayload.tags[0].name  = <tagName>
    * set requestPayload.status = <status>
    When method get
    Then  status 200
    Then match response !contains requestPayload
    Examples:
      | id        | categoryId | categoryName | name     | photoUrl | tagId     | tagName  | status |
      | "#number" | "#number"  | "string"     | "string" | "string" | "#number" | "string" | "sold" |

