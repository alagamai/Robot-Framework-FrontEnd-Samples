*** Settings ***
Documentation    To place an order from ecom portal
...                It demos usage of locators using id, css, xpath
...                Usage of Gherkin Syntax test cases, Suite setup / teardown, variables
...                 usage of asserts
Library    SeleniumLibrary
Library       Collections
Library        OperatingSystem


*** Variables ***
${BROWSER}    Chrome
${SEARCH_BAR}         css:#small-searchterms
${SEARCH_BUTTON}        css:.button-1.search-box-button
${CHROME_DRIVER_PATH}    /usr/local/bin/chromedriver
${ENTER_QTY}            css:#product_enteredQuantity_3
${ADD_TO_CART_BUTTON}        css:button#add-to-cart-button-3
${SNACK_BAR1}            id:bar-notification
${SHOPPING_CART}        xpath://span[@class='cart-qty']


*** Keywords ***
Open Browser
    Create Webdriver    ${BROWSER}
    Go To    https://demo.nopcommerce.com/

Close Browser
    Close All Browsers