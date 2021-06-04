Feature: Karate Test Suite 20
  Splunk

  Background: Init
    * def login =
    """
    function(uid, pwd) {
        var temp = uid + ':' + pwd;
        var Base64 = Java.type('java.util.Base64');
        var encoded = Base64.getEncoder().encodeToString(temp.bytes);
        return 'Basic ' + encoded;
    }
    """
    * def auth = login("palmetoadmin", "P@lmeto@123")
    * print auth
    * configure ssl = true

    Given url "https://10.0.0.60:8089"
    And header Authorization = auth

  Scenario: Splunk validation testcase 1

    Given path "/services/search/jobs"
    When method get
    Then status 200
    * print response
    * print responseType
    * match response /feed/author/name == "Splunk"


  Scenario: Splunk validation testcase 2

    Given path "/services/alerts/alert_actions"
    When method get
    Then status 200
    * print response
#    * print responseType
    * match response /feed/entry[1]/title == "email"

  Scenario: Splunk validation testcase 3

    Given path "/services/alerts/fired_alerts"
    When method get
    Then status 200
    * def res = get response /feed/entry/content/dict/key/dict/key[@name='app']
    * def res1 = get response //content/dict/key/dict/key[@name='app']
    * print res
    * match res == "search"





