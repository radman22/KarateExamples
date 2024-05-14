Feature: Test different kind of type casting 

Scenario: Number to String
    * def num = 10
    * def json = {"number":#(num+'')}
    * match json == {"number":"10"} 

Scenario: String to Number
    * def number = '10'
    * def json = {"number":#(parseInt(number))}
    * match json == {"number":10} 

