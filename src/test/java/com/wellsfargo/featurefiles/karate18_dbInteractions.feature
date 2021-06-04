
Feature: Karate Test Suite 18
  DB interaction

  Background: dbInit
    * def db = Java.type('com.wellsfargo.utils.MyDBUtils')

  @db
  @select
  Scenario: select stmt TestCase 1
  This is for db select stmt test case1
  db select validation 1

    * def rows = db.selectStatement("select * from tools")
    * print rows

  @db
  @insert
  Scenario: insert stmt TestCase 2
  This is for db insert stmt test case2
  db select validation 1

    * def result = db.insertStatement("Insert into tools values(2110,'java211','python')")
    * print result
    * match result == "Success"
    * def rows = db.selectStatement("select * from tools where toolid=2110")
    * print rows
    * match rows contains "java211"


  @db
  @update
  Scenario: update stmt TestCase 3
  This is for db update stmt test case3

    * def rowsaffected = db.updateStatement("update tools set toolname='sample3' where toolid=2110")
    * print rowsaffected
    * assert rowsaffected >= 1
    * def rows = db.selectStatement("select * from tools where toolid=2110")
    * print rows
    #* match rows contains "java211"
    * match rows contains "sample3"

  @db
  @delete
  Scenario: delete stmt TestCase 4
  This is for db delete stmt test case4

    * def rowsaffected = db.deleteStatement("delete from tools where toolid=2110")
    * print rowsaffected
    * assert rowsaffected >= 1
    * def rows = db.selectStatement("select * from tools where toolid=2110")
    * print rows
    #* match rows contains "java211"
    * match rows !contains "sample3"
