Feature: Crear usuario y recuperar datos

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Crear un nuevo usuario
    Given path '/user'
    And request { "username": "john.doe", "email": "john.doe@example.com", "password": "password123" }
    When method post
    Then status 200
    * def name = response

  Scenario: Recuperar datos del usuario creado
    Given path '/user/',
    And path 'john.doe'
    When method get
    Then status 200

