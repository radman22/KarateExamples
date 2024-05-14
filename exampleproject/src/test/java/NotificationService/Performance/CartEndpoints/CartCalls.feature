@cart
@parallel=false
Feature: User can clear the cart    
    Background: Define test data 
        Given url jsonApiCartUrl

    Scenario Outline: Add Multiple products to the cart 
        Given path 'addToCart'
        And request <cartItems>
        And header karate-name = "Add to cart product"
        When method post 
        Then status 200
        And match response.responseStatus == 'OK'
        And match response.validationErrors == null
        And match response.items[0].itemId != null
        * karate.pause(5000)  

        Examples:
            | cartItems |
            | read('classpath:NotificationService/feature/JSON/productAcrylicglass.json') |
            | read ('classpath:NotificationService/feature/JSON/productAcrylicMatt.json') |
    

    Scenario: verify clear cart call return success response
        Given path 'clearCart'
        When method post
        Then status 200


