Feature: Syntax practice

  Scenario: Defining variables
    Given def myVar = 'world'
    Then print myVar

  Scenario: creating a jsonarray using table
    * table users
      | name      | age |
      | 'nitin'   | 34  |
      | 'shefali' | 23  |
    * print users

  Scenario: Retrieve all flights using endpoint
    * def sampleJson = read('classpath:sample_root.json')
    * print sampleJson

  Scenario: multiple headers in a single line
    And headers = {Authorization: 'abc', tx_id: '1234', extraTokens: ['abc', 'def']}

  Scenario: Running http method based on some condition
    * def putOrPost = (someVariable == 'dev' ? 'put' : 'post')
    * method putOrPost

  Scenario: using response status code in a expression using 'responseStatus'
    * def responseCode = responseStatus
    Then assert responseCode == 200 || responseCode == 204