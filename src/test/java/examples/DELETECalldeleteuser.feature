Feature: POST call Examples

  Background:  Set headers and request payload
    # create user
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

    Scenario: validate delete user DELETE API
      # create user
    Given url 'https://gorest.co.in/'
    And path 'public/v2/users'
    And header Authorization = authToken
    And request requestPayload
    And method POST
    Then status 201
    * def responseData = response
    * print response
    * def userId = response.id
    * print userId
      # delete user
      Given url 'https://gorest.co.in/'
      And path 'public/v2/users/' + userId
      And header Authorization = authToken
      And method DELETE
      Then status 204
      # get user
      Given url 'https://gorest.co.in/'
      And path 'public/v2/users/' + userId
      And method GET
      Then status 404
      * print response
      * match response.message == 'Resource not found'