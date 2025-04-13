Feature:Casos de prueba Proyecto final

  Scenario: CP01 - Registrar usuario
    * def body =
        """
        {
    "email": "pamela@gmail.com",
    "password": "12345678",
    "nombre": "Marco",
    "tipo_usuario_id": 1,
    "estado": 1
      }

      """
   Given url "https://api.qateamperu.com"
    And path "api/register"
    And header Content-Type = 'application/json'
    And  header Accept = 'application/json'
    And request body
    When method post
    Then status 200

  Scenario: CP02 - Registrar un usuario no valido

    * def body =
        """
        {
    "email": "768787@gmail.com",
    "password": "12345678",
    "nombre": "00000",
    "tipo_usuario_id": 1000,
    "estado": 1
      }

     """
    Given url "https://api.qateamperu.com"
    And path "api/register"
    And header Content-Type = 'application/json'
    And  header Accept = 'application/json'
    And request body
    When method post
    Then status 200


  Scenario: CP03 - Login de un usuario

    * def body =

    """
    {
        "email" : "carlosz@gmail.com"
        "password" : "12345678"
     }
    """

    Given  url "https://api.qateamperu.com"
    And path "api/login"
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request body
    When method post
    Then status 200

