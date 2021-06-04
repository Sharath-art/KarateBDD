Feature: Karate Test Suite 7
  reading payload data from  file

  @soap
  Scenario: read from  file testcase1
  this is fr read from file

    * def xml = read("tempConver_input.xml")
    * print xml
    * match xml //CelsiusToFahrenheit/Celsius == 39
