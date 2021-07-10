Feature: list users

#  Scenario: Get all the users for page 2
#    Given url 'https://reqres.in'
#    And path 'api/users'
#    And param page = 2
#    And header content-type = 'application/json'
#    When method get
#    Then status 200
#    And print 'response is --', response


  Scenario: Create user
    Given url 'https://reqres.in'
    And path 'api/users'
    And header content-type = 'application/json'
    * def createuserpayload =  read('payload/createuserpayload.json')
    * replace createuserpayload
      | token | value           |
      | name  | 'namefromtable' |
      | job   | 'jobfromtable'  |
    And request createuserpayload
    When method post
    Then status 201
    And print 'response is --', response
