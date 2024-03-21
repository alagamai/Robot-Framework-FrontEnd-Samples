*** Settings ***
Documentation    To place an order from ecom portal
...                It demos usage of locators using id, css, xpath
...                Usage of Gherkin Syntax test cases, Suite setup / teardown, variables
...                 usage of asserts, passing values to keyword defn
Test Setup         Open Browser
Test Teardown      Close Browser
Resource        resources.robot

*** Variables ***


*** Test Cases ***
Scenario: Search for a product
        Given I am on e-commerce portal
        When I search for the item "Lenovo"
        And I click on item         "Lenovo IdeaCentre 600 All-in-One PC"
        Then I should be taken to item detail page
#        And I save session or cookies

Scenario: Add to cart
    Given I am on product detail page lenovo-ideacentre-600-all-in-one-pc
#        And I restore session or cookies
    When I add 2 items to cart
    Then cart qty should be 2 for the item lenovo-ideacentre-600-all-in-one-pc

#Scenario: Navigate to cart page
#    Given I am on e-commerce portal
#    When I click on Shopping cart
#    Then I should be taken to cart detail page
#    Then I shoud see product total and order subtotal for 2 items


*** Keywords ***

I am on e-commerce portal
    Go To   https://demo.nopcommerce.com/

I search for the item "${item}"
    Input Text    ${SEARCH_BAR}    ${item}
    Click Button    ${SEARCH_BUTTON}

I click on item
    [Arguments]    ${item_name}
        Click Element    xpath://a[contains(text(), ${item_name})]

I should be taken to item detail page
        Location Should Be    https://demo.nopcommerce.com/lenovo-ideacentre-600-all-in-one-pc

I am on product detail page ${item_name}
    Go To    https://demo.nopcommerce.com/${item_name}

I add 2 items to cart
    Clear Element Text    ${ENTER_QTY} 
    Input Text    ${ENTER_QTY}     2
    ${cookies}=    Get Cookies
    ${cookie_dict}=    Evaluate    dict(item.split('=') for item in "${cookies}".split('; '))
    ${nop_customer_value}=    Get From Dictionary    ${cookie_dict}    .Nop.Customer
    Log    ${nop_customer_value}
    ${values}=  Get Dictionary Items     ${cookie_dict}  
    Log Many       ${values}
    Click Button     ${ADD_TO_CART_BUTTON} 
    Wait Until Element Is Visible        ${SNACK_BAR1}  
    ${content}=     Get Text        ${SNACK_BAR1}
    Should Be Equal As Strings        ${content}    The product has been added to your shopping cart
    Capture Page Screenshot



cart qty should be 2 for the item ${item_name}
        Go To    https://demo.nopcommerce.com/${item_name}
        Wait Until Element Is Visible    ${SHOPPING_CART}
        Capture Page Screenshot
        ${cart_qty}=    Get Text    ${SHOPPING_CART}
        Should Be Equal As Strings    ${cart_qty}     (2)
        Log     ${cart_qty}




#Save session or cookies
#    ${cookies}=    Get Cookies
#    Set Suite Variable    ${cookies}
#
#Restore session or cookies
#    ${cookies}=    Get Suite Variable    ${cookies}
#    Add Cookie    ${cookies}