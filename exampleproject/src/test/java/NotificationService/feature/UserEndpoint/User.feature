
@user
@parallel=false
Feature: Test all the user endpint 
    Background: Define test data 
        Given  url jsonApiUrl
        * def dataGenrator = Java.type('NotificationService.feature.helper.DataGenerator')
        * def useremail = dataGenrator.randomEmail()
        * def username = dataGenrator.randomUsername()
        * def surname = dataGenrator.surname()
        * def  userdetails = 
        """
            {
                "registerEmail": #(useremail),
                "registerCountry": "DE",
                "registerPassword": "test1234",
                "registerPassword2": "test1234",
                "tcRead": "on",
                "registerGender": "m",
                "basic":"on",
                "registerForename": #(username),
                "registerSurname": #(surname),
                "mediaCode": "mag"
            }

        """
        
        * def password =
        """
            {
                 "password": "test1234"
            
            }


        """ 

    Scenario: Verify we can create a user with basic flag
        Given path 'createUser'
        And request  userdetails
        When method post
        Then status 200
        And match response.isLoggedIn == true
        And match response.responseStatus contains 'OK'
        And match response.actionStatus contains 'SUCCESS'

    
    Scenario: Verify we can delete the user
        Given path 'deleteUserAccount'
        And request password
        When method post
        Then status 200

        



