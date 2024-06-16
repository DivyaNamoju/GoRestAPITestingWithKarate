Feature: Hello world with Karate

  Scenario: validate print hello world statement

    * print 'Hello world'

  Scenario: validate printing different data types and arithmetic operations

    * print 20
    * print 30
    * def sum = 20+30
    * print sum
    * def a = 45
    * def b = 56
    * print (a*b)
    * print (a-b)
    * print (a/b)
    * print (a%b)
    * def flag = false
    * print flag