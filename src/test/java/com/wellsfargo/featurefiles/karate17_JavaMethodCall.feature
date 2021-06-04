
Feature: Karate Test Suite 17
  java method call

  Scenario: java  static method  call test case1
  java  static method call test case1

    * def result1 =
    """
    function(){
     var a = Java.type('com.wellsfargo.utils.BDDUtil')
     return a.getStaticMethod();
    }
    """
    * print result1()

  Scenario: java non static method  call test case1
  java non static method call test case1

    * def result2 =
    """
    function(){
     var a = Java.type('com.wellsfargo.utils.BDDUtil')
     return a.getNonStaticMethod();
    }
    """
    * print result2()

