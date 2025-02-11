*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser       http://automationexercise.com
Suite Teardown    Close Browser
*** Variables ***
${SEARCH_TERM}        Dress
${USERNAME}           testuser@example.com
${PASSWORD}           password123

*** Keywords ***
Click Products Button
    Click Element    //a[contains(text(),'Products')]

Verify Navigation To All Products Page
    Wait Until Page Contains    ALL PRODUCTS

Search For Product
    Input Text      //*[@id="search_product"]    ${SEARCH_TERM}
    Click Button    //*[@id="login-button"]

Verify Search Results
    Wait Until Page Contains    SEARCHED PRODUCTS
    Page Should Contain    ${SEARCH_TERM}

Add Products To Cart
    Click Element    /html/body/section[2]/div/div/div[2]/div/div[2]/div/div[1]/div[1]/a

Verify Products In Cart
    Click Element   //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]
    Wait Until Page Contains    ${SEARCH_TERM}

Login To Account
    Click Element   //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
    Input Text      //*[@id="form"]/div/div/div[1]/div/form/input[2]    ${USERNAME}
    Input Text      //*[@id="form"]/div/div/div[1]/div/form/input[3]    ${PASSWORD}
    Click Button    //*[@id="form"]/div/div/div[1]/div/form/button
    Wait Until Page Contains    Logged in as

Verify Products In Cart After Login
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]
    Wait Until Page Contains    ${SEARCH_TERM}


*** Test Cases ***
Search Products and Verify Cart After Login
    Maximize Browser Window
    Click Products Button
    Verify Navigation To All Products Page
    Search For Product    ${SEARCH_TERM}
    Click Button
    Verify Search Results
    Add Products To Cart
    Verify Products In Cart
    Login To Account
    Verify Products In Cart After Login
    Close Browser
