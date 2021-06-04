
Feature: Karate Test Suite 115
  js function call

  Scenario: js function call test case1
  js function call test case1

    * def f1 = function(){ return 10; }
    * def f2 =
    """
    function(a){
      karate.log(a);
      return 10;
    }
    """
    * print f1()
    * f2("hello")
