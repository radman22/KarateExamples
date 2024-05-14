@first
Feature: Tests for all the notification service endpoints 
    
    Background: Define URL
        Given url apiUrl

    Scenario: Verify the health endpoint
        Given path 'actuator/health'
        When  metho Get
        Then  status 200
        And match response.status contains 'UP'
        And match response.status == "#string"
        

    Scenario Outline: Verify notify endpoint
        Given path 'notify'
        And request <paylaodData>
        And header Authorization = 'Basic YWR5ZW5fdGVzdDpBZHllbjIwMTgh'
        When method post
        Then status 200 
        And match response.notificationResponse == "#string"
        And match response.notificationResponse contains '[accepted]'

        Examples:
            | paylaodData |
            | read('classpath:NotificationService/feature/JSON/DENotifypayload.json') |
            | read ('classpath:NotificationService/feature/JSON/CANotifypayload.json') |
    
    


