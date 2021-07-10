Feature: Create, update and delete flight

  Background:
    * url baseUrl
    * headers headers

  Scenario: get request using the relative path
    Given path 'flights'
    When method get
    Then status 200
    And print 'response is --', response

  Scenario: post request using inline json payload
    Given path 'flight'
    And request {"available_seats_Y": "5","available_seats_J": "2","available_seats_F": "3","carrierCode": "EK"}
    When method post
    Then status 201
    And print 'response is ----', response

  Scenario: post request using inline json without using double quotes in the key's name payload
    Given path 'flight'
    And request {available_seats_Y: "5",available_seats_J: "12",available_seats_F: "3",carrierCode: "EK"}
    When method post
    Then status 201
    And print 'response is ----', response

  Scenario: post request using payload from json file
    Given path 'flight'
    And request read('payload/createFlightPayload.json')
    When method post
    Then status 201
    And print 'response is ----', response

  Scenario: Create flight using payload json file
    Given path 'flight'
    And request read('payload/createFlightPayload.json')
    When method post
    Then status 201
    And print 'response is ----', response

  Scenario: post request by creating dynamic inline json by replacing variables
    Given path 'flight'
    * def createFlightPayload = {available_seats_Y: <Y_SEATS>,available_seats_J: <J_SEATS>,available_seats_F: <F_SEATS>,carrierCode: <carrierCode>}
    * replace createFlightPayload
      | token       | value |
      | Y_SEATS     | '10'  |
      | J_SEATS     | '2'   |
      | F_SEATS     | '3'   |
      | carrierCode | 'FK'  |
    And request createFlightPayload
    When method post
    Then status 201
    And print 'response is ----', response

  Scenario: post request by creating dynamic json by replacing variables in a json file
    Given path 'flight'
    * def createFlightPayload = read('payload/createFlightPayload.json')
    * replace createFlightPayload
      | token       | value |
      | Y_SEATS     | '10'  |
      | J_SEATS     | '30'  |
      | F_SEATS     | '30'  |
      | carrierCode | 'FK'  |
    And request createFlightPayload
    When method post
    Then status 201
    And print 'response is ----', response

  Scenario: post request by creating dynamic json by replacing only variables at desired places a json file
    * def createFlightPayload = read('payload/sample.json')
    * replace createFlightPayload
      | token | value              |
      | name  | 'text replacement' |
      | age   | 30                 |
    And print 'request payload is ----', createFlightPayload