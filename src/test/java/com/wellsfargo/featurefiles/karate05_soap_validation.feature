Feature: Karate Test Suite 5
  soap api complete validation

  @soap
  Scenario: soap validation 1.1 testcase1
  this is the first soap complete testcase of soap

    Given url "https://www.w3schools.com/xml/tempconvert.asmx"
    And header Content-Type = "text/xml; charset=utf-8"
    And request
    """
    <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
         <soap:Body>
             <CelsiusToFahrenheit xmlns="https://www.w3schools.com/xml/">
             <Celsius>37</Celsius>
             </CelsiusToFahrenheit>
         </soap:Body>
       </soap:Envelope>
    """
    When soap action "https://www.w3schools.com/xml/CelsiusToFahrenheit"
    Then status 200
    * print responseHeaders
    * match responseHeaders["Server"] == ["Microsoft-IIS/7.5"]
    * match responseHeaders["Server"][0] == "Microsoft-IIS/7.5"
    * match responseType == "xml"
    * print response
    * match response contains "98"
    * match response //CelsiusToFahrenheitResult == 98.6
    * assert responseTime <= 2000
    * print responseTime

    ######
  @soap
  Scenario: soap validation 1.2 testcase1
  this is the second soap complete testcase of soap

    Given url "https://www.w3schools.com/xml/tempconvert.asmx"
    And header Content-Type = "application/soap+xml; charset=utf-8"
    And request
    """
    <?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <CelsiusToFahrenheit xmlns="https://www.w3schools.com/xml/">
      <Celsius>40</Celsius>
    </CelsiusToFahrenheit>
  </soap12:Body>
</soap12:Envelope>
    """
    When method post
    Then status 200
    * print responseHeaders
    * match responseHeaders["Content-Type"] == ["application/soap+xml; charset=utf-8"]
    * match responseHeaders["Content-Type"][0] == "application/soap+xml; charset=utf-8"
    * match responseType == "xml"
    * print response
    * match response contains "104"
    * match response //CelsiusToFahrenheitResult == 104
    * assert responseTime <= 2000
    * print responseTime