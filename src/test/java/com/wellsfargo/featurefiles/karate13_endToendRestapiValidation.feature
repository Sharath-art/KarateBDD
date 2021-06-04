Feature: Karate Test Suite 13
  This test suite for rest api with end to end validation(api chaining)

  @rest
  Scenario: Rest api e2e TestCase 1
  This is for rest e2e validation test case1
    #------Creating resource------
    Given url "https://jsonplaceholder.typicode.com/posts"
    And header Content-Type = "application/json; charset=UTF-8"
    And request
    """
    {
    title: 'foo',
    body: 'bar',
    userId: 1,
    }
    """
    When method post
    Then status 201
    * print response
    #* def id = response.id
    * def id = 1
    * print id

		#------fetching resource------
    Given url "https://jsonplaceholder.typicode.com/posts/" + id
    When method get
    #* match response.title == "foo"

    #------updating resource------
    Given url "https://jsonplaceholder.typicode.com/posts/" + id
    And header Content-Type = "application/json; charset=UTF-8"
    And request "{id: " + id + ", title: 'foo', body: 'bar', userId: 1}"
    When method put
   # Then status 200

    #------deleting resource------
    Given url "https://jsonplaceholder.typicode.com/posts/" + id
    When method delete
   # Then status 200