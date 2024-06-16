Feature: POST call Examples

  Background:  Set request payload
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
    * def randomString = generateRandomString(10);
    * def requestPayload =
      """
      {
            "gender": "male",
            "status": "active"
      }
      """
    * requestPayload.name = randomString
    * requestPayload.email = randomString + '@mail.com'
    * print requestPayload

  Scenario: validate create user POST API
    Given url 'https://gorest.co.in/'
    And path 'public/v2/users'
    And header Authorization = authToken
    And request requestPayload
    And method POST
    Then status 201
    * def responseData = response
    * print response
    * def userId = response.id