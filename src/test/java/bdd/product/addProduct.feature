Feature: Añadir un producto

    Background:

       * def responseLogin = call read('classpath:bdd/auth/loginAuth.feature@login')
       * def tokenAuth = responseLogin.token
       * print tokenAuth
       * header Accept = 'Application/json'
       * header Authorization = 'Bearer' + tokenAuth

    Scenario: Añadir producto correctamente

      * def body =

        """
         {
            "email": "Jane@gmail.com",
            "password": "12345678",
            "nombre": "Marco",
            "tipo_usuario_id": 1,
            "estado": 1
         }
        """
        Given url urlBase
        And path 'api/register'
        And request body
        * print body
        When method post
        Then status 200


  Scenario: Añadir producto con estado inválido

    * def body =

        """
         {
            "email": "Jane@gmail.com",
            "password": "12345678",
            "nombre": "Marco",
            "tipo_usuario_id": 1,
            "estado": X
         }
        """
    Given url urlBase
    And path 'api/register'
    And request body
    * print body
    When method post
    Then status 200


  Scenario: Añadir producto con nombre NULL

    * def body =

        """
         {
            "email": "Jane@gmail.com",
            "password": "12345678",
            "nombre": null,
            "tipo_usuario_id": 1,
            "estado": 1
         }
        """
    Given url urlBase
    And path 'api/register'
    And request body
    * print body
    When method post
    Then status 200


  Scenario: Añadir producto con status 400

    * def body =

        """
         {
            "email": "Jane@gmail.com",
            "password": "12345678",
            "nombre": "Marco",
            "tipo_usuario_id": 1,
            "estado": 1
         }
        """
    Given url urlBase
    And path 'api/register'
    And request body
    * print body
    When method post
    Then status 400