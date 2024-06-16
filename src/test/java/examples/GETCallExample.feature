Feature: GET USER API

  Scenario: validate the get user API
    Given url 'https://gorest.co.in/public/v2/users/'
    And path '6940081'
    And method GET
    Then status 200
    * def responseData = response
    * print responseData
    * match responseData.id == 6940081

  Scenario: validate the pagination of get user API

    * def queryParams = {page:2,per_page:20}
    * print queryParams
    Given url 'https://gorest.co.in/public/v2/users/'
    And params queryParams
    And method GET
    Then status 200
    * def responseData = response
    * print responseData

  Scenario Outline: validate pagination of get users API - Data driven Testing
    * def queryParams = {page:<pageNum>,per_page:<numberOfRecords>}
    * print queryParams
    Given url 'https://gorest.co.in/public/v2/users/'
    And params queryParams
    And method GET
    Then status 200
    * def responseData = response
    * print responseData
    * print responseData[0].count == <countOfRecords>
    Examples:
      | pageNum | numberOfRecords | countOfRecords |
      |1        | 80              | 80             |
      |2        | 10              | 10             |
      |3        | 20              | 20             |
