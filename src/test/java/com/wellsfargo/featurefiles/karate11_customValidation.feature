Feature: Karate Test Suite 11
  This test suite for custom validation

  Scenario: Rest TestCase 1
  This is for custom validation using logical operator &&

    * def a = 12
    * def b = 23
    * assert a == 12 && b == 23

  Scenario: Rest TestCase 2
  This is for custom validation using logical operator ||

    * def a = 12
    * def b = 23
    * assert a == 12 || b == 2

  Scenario: Rest TestCase 3
  This is for custom validation using logical operator !=

    * def a = 12
    * def b = 23
    * assert a != 0

  Scenario: TestCase 4
  This is for custom validation using matches(data types)

    * def a = 12
    * def b = "uppi"
    * def c = false
    * match a == "#number"
    * match b == "#string"
    * match c == "#boolean"

  Scenario: TestCase 5 reg exp
  This is for custom validation using matches(regular expressions)

    * def a = "12"
    * def b = "uppi karate som"
    * def c = "KARATE"
    * def c1 = "karate"
    * def c2 = "Karate"
    * def d = "100.01"
    * def e = "karate bdd"
    * def e1 = "cucumber bdd"
    * match a == "#regex \\d+"
    * match d == "#regex \\d+\\.\\d+"
    * match c == "#regex [A-Z]+"
    * match c1 == "#regex [a-z]+"
    * match c2 == "#regex [A-Z][a-z]+"
    * match b == "#regex ([A-Za-z]+\\s?)+"
    * match b == "#regex (\\w+\\s?)+"
    * match b == "#regex (^uppi\.*)"
    * match b == "#regex (\.*som$)"
    * match e == "#regex (karate|cucumber) bdd"
    * match e1 == "#regex (karate|cucumber) bdd"
#    * match c == "#regex (^test\.*)"
#    * match c == "#regex (\.*file$)"
