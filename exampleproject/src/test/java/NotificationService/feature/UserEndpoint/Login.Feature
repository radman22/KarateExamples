@login
Feature: Test the login endpoint 
    
    Background: Define test data 
        Given  url jsonApiUrl
        * def  logindetails = 
        """
            {
            "loginEmail": "#(userEmail)",
            "loginPassword": "#(userpassword)"
            }

        """
        * configure afterScenario = function(){ karate.call('classpath:NotificationService/feature/CartEndpoints/ClearCart.feature') }
        * configure afterFeature = 
        """
            function(){
                karate.log("The final result")
            }

        """  
    
    # Scenario: verify user can login
    #     Given path 'loginUser'
    #     And request  logindetails
    #     When method post
    #     Then status 200
    #     And match response.responseStatus contains 'OK'
    #     And match response.actionStatus contains 'SUCCESS'

    Scenario: Retry login 
        * configure retry = {count:1, interval:5000}

        Given path  'loginUser'
        And request logindetails
        And retry until response.actionStatus == 'ERROR'
        When method post
        Then status 200

    


