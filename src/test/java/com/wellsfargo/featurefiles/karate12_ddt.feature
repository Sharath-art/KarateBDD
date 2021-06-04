Feature: Karate Test Suite 12
  This test suite for ddt validation

  @ddt
  Scenario Outline: ddt

    Given url "https://www.w3schools.com/xml/tempconvert.asmx/CelsiusToFahrenheit"
    And header Content-Type = "application/x-www-form-urlencoded"
    And request "Celsius=<celsius>"

    When method post
    Then status 200
    * match response //string == <Fahrenheit>
    Examples:
      | celsius | Fahrenheit |
      | 40      | 104        |
      | 37      | 98.6       |
      | abc     | "Error"    |

  @ddt
  Scenario Outline: ddt2 reading external file for ddt

    Given url "https://www.w3schools.com/xml/tempconvert.asmx/CelsiusToFahrenheit"
    And header Content-Type = "application/x-www-form-urlencoded"
    And request "Celsius=<celsius>"

    When method post
    Then status 200
    * match response //string == <Fahrenheit>
    Examples:
    |read("ddtinput.csv")|

