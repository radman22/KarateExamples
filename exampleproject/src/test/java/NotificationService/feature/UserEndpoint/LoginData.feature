@dbdata
Feature: Get data from the database 
    Background: Connect to DB 
        * def dbhandler = Java.type('NotificationService.feature.helper.DBdataCollection')

Scenario: Get username and password from the database 
    * def jsonData = dbhandler.getUsernameAndPassword()
    * print jsonData
