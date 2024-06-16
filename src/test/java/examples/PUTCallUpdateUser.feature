Feature: PUT call Examples

  Scenario: validate update user PUT API

    * header Authorization = authToken
    * def requestPayload =
    """
    {
    "name": "Deeptimayee Guneta IV",
    "email": "guneta_iv_deeptimayee@mail.com",
    "gender": "female",
    "status": "inactive"
    }
    """
    Given url 'https://gorest.co.in/'
    And path 'public/v2/users/6940083'
    And request requestPayload
    And method PUT
    Then status 200
    * def responseBody = response
    * print responseBody
    # validate the response body
    * match responseBody.name == requestPayload.name
    * match responseBody.email == requestPayload.email
    * match responseBody.gender == requestPayload.gender
    * match responseBody.status == requestPayload.status
    * def id = responseBody.id


