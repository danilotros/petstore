Feature: oauth 2 test using

  Background:
    * url 'https://postman-echo.com'

  Scenario: Get token

    * path 'get'
    * param access_token = '345365454ddhfdhdhg'
    * param username = username
    * param password = password
    * print username
    * method GET
    * status 200

    * def accessToken = response.args.access_token
    * print accessToken