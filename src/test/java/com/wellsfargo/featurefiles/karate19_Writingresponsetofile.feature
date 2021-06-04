
Feature: Karate Test Suite 19
  writing response to file

Scenario: writing response to file 1

  * def util = Java.type("com.wellsfargo.utils.BDDUtil")
  Given url "https://jsonplaceholder.typicode.com/posts/1"
  When method get
  Then status 200
  * def result = get response
  * util.writeToFile("TestFile.json",result)

  Scenario: reading  response to file 2

    * def fileResponse = read("classpath:TestFile.json")
    * print fileResponse
