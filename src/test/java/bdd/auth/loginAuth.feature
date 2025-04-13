Feature: Login

  Background:
    * url urlBase
    * path "api/login"

  Scenario: CP03 - Login de un usuario correcto

   * def body =
    """
    {
        "email" : "carlosz@gmail.com" ,
        "password" : "12345678"
     }
    """

      And header Content-Type = 'application/json'
      And header Accept = 'application/json'
      And request body
      When method post
      Then status 200

  Scenario: CP04 - Login de un usuario incorrecto

    * def body =
    """
    {
        "email" : "daily2713@gmail.com" ,
        "password" : "12345678"
     }
    """

    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And request body
    When method post
    Then status 200