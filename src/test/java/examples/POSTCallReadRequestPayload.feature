Feature: POST call Examples

  Scenario: validate create user POST API - Read request payload from file

    * header Authorization = authToken
    * def requestPayload = read('CreateUserRequestPayload.json')
    Given url 'https://gorest.co.in/'
    And path 'public/v2/users/'
    And request requestPayload
    And method POST
    Then status 201
    * def responseData = response
    * print response
    # validate the response body
    * match response.name == requestPayload.name
    * match response.email == requestPayload.email
    * match response.gender == requestPayload.gender
    * match response.status == requestPayload.status

  Scenario: validate create user POST API - set random values

    * header Authorization = authToken
    * def generateRandomString =
      """
      function(len) {
        var text = "";
        var pattern = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for(var i=0;i<len;i++){
            text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
            }
        return text;
      }
      """
    * def randomString = generateRandomString(12);
    * def requestPayload = read('CreateUserRequestPayloadSetValues.json')
    * set requestPayload.name = randomString
    * set requestPayload.email = randomString + '@mail.com'
    Given url 'https://gorest.co.in/'
    And path 'public/v2/users/'
    And request requestPayload
    And method POST
    Then status 201
    * def responseData = response
    * print response
    # validate the response body
    * match response.name == requestPayload.name
    * match response.email == requestPayload.email
    * match response.gender == requestPayload.gender
    * match response.status == requestPayload.status
