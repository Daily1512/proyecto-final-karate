Feature: Obtener por producto

  Background:

    * def responseLogin = call read('classpath:bdd/auth/loginAuth.feature@login')
    * def tokenAuth = responseLogin.token
    * print tokenAuth
    * header Accept = 'application/json'
    * header Authorization = 'Bearer ' + tokenAuth

  Scenario: Obtener producto

    Given url urlBase
    And path 'api/v1/producto/:idproducto'
    And params idproducto = 3
    When method get
    Then status 200

