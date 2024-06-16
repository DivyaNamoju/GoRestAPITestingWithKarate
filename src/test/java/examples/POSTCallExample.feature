Feature: POST call Examples

  Scenario: validate create user POST API

    * header Authorization = authToken
    * def requestPayload =
    """
    {
        "name": "karateuser-00015",
        "email": "karate_user00015@mail.com",
        "gender": "male",
        "status": "active"
    }
    """
    Given url 'https://gorest.co.in/'
    And path 'public/v2/users/'
    And request requestPayload
    And method POST
    Then status 201
    * def responseData = response
    * print response
    # validate the user creation after the successful POST call
    * def userId = response.id
    * print 'User Id' + userId
    Given url 'https://gorest.co.in/public/v2/users/'
    And path userId
    And method GET
    Then status 200
    * def responseData = response
    * print responseData


