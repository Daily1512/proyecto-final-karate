Feature: Actualizar producto

  Background:

    * def responseLogin = call read('classpath:bdd/auth/loginAuth.feature@login')
    * def tokenAuth = responseLogin.token
    * print tokenAuth
    * header Accept = 'application/json'
    * header Authorization = 'Bearer' + tokenAuth

  Scenario: Actualizar producto con ID TC0001
    

    * def body =

        """
         {
           "codigo": "TC0001",
           "nombre": "ALTERNADOR PL200NS",
           "medida": "UND ",
           "marca": "Generico",
           "categoria": "Repuestos",
           "precio": "35.00",
           "stock": "60",
           "estado": "3",
           "descripcion": "ALTERNADOR PL200NS"
          }
        """

    Given url urlBase
    And path 'api/v1/producto/:idproducto'
    And request  body
    When method put
    Then status 200