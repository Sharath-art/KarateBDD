Feature: Karate Test Suite 6
  reading payload data from external file

  @soap
  Scenario: soap validation 1.1 payload data from external file testcase1
  this is the first soap payload data from external file testcase of soap

    Given url "https://www.w3schools.com/xml/tempconvert.asmx"
    And header Content-Type = "text/xml; charset=utf-8"
    And request read("tempConver_input.xml")

    When soap action "https://www.w3schools.com/xml/CelsiusToFahrenheit"
    Then status 200
    * print responseHeaders
    * match responseHeaders["Server"] == ["Microsoft-IIS/7.5"]
    * match responseHeaders["Server"][0] == "Microsoft-IIS/7.5"
    * match responseType == "xml"
    * print response
    * match response contains "102.2"
    * match response //CelsiusToFahrenheitResponse/CelsiusToFahrenheitResult == 102.2
    * assert responseTime <= 2000
    * print responseTime

    ######
