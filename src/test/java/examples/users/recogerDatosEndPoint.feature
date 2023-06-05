Feature: Recoger JSON y listar nombres de mascotas vendidas

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Recoger JSON de mascotas vendidas
    Given path '/pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200
    And def petList = $response[*]
    And def soldPets = karate.filter(petList, function(pet){ return pet.status == 'sold' })
    And def petNames = karate.map(soldPets, function(pet){ return {id: pet.id, name: pet.name} })
    And print 'Nombres de mascotas vendidas:', petNames