*** Settings ***
Library    SeleniumLibrary
Library       Collections
Suite Setup    Open Browser
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Chrome
${SEARCH_BAR}         css:#small-searchterms
${SEARCH_BUTTON}        css:.button-1.search-box-button
${CHROME_DRIVER_PATH}    /usr/local/bin/chromedriver

    

*** Test Cases ***
Scenario: Search for a product
        Given I am on e-commerce portal
        When I search for the item "Lenovo"
        And I click on item "Lenovo IdeaCentre 600 All-in-One PC"
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
Open Browser
    Create Webdriver    ${BROWSER}
    Go To    https://demo.nopcommerce.com/

Close Browser
    Close All Browsers

I am on e-commerce portal
    Go To   https://demo.nopcommerce.com/

I search for the item "${item}"
    Input Text    ${SEARCH_BAR}    ${item}
    Click Button    ${SEARCH_BUTTON}

I click on item "${item_name}"
        Click Element    xpath://a[contains(text(), '${item_name}')]

I should be taken to item detail page
        Location Should Be    https://demo.nopcommerce.com/lenovo-ideacentre-600-all-in-one-pc

I am on product detail page ${item_name}
    Go To    https://demo.nopcommerce.com/${item_name}

I add 2 items to cart
    Clear Element Text    css:#product_enteredQuantity_3
    Input Text    css:#product_enteredQuantity_3    2
    ${cookies}=    Get Cookies
    ${cookie_dict}=    Evaluate    dict(item.split('=') for item in "${cookies}".split('; '))
    ${nop_customer_value}=    Get From Dictionary    ${cookie_dict}    .Nop.Customer
    Log    ${nop_customer_value}
    ${values}=  Get Dictionary Items     ${cookie_dict}  
    Log Many       ${values}
    Click Button     css:button#add-to-cart-button-3
    Capture Page Screenshot



cart qty should be 2 for the item ${item_name}
        Go To    https://demo.nopcommerce.com/${item_name}
        Wait Until Element Is Visible    xpath://span[@class='cart-qty']
         Capture Page Screenshot 
        ${cart_qty}=    Get Text    xpath://span[@class='cart-qty']
        Log     ${cart_qty}




#Save session or cookies
#    ${cookies}=    Get Cookies
#    Set Suite Variable    ${cookies}
#
#Restore session or cookies
#    ${cookies}=    Get Suite Variable    ${cookies}
#    Add Cookie    ${cookies}