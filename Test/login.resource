*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${URL}    https://www.saucedemo.com/
${BROWSER}    chrome


*** Keywords ***

login with valide credential
    Open Browser    ${URL}    ${BROWSER} 
    Input Text    id=user-name    standard_user
    Input Text    id=password    secret_sauce
    Click Button    id=login-button
    #Element Should Be Visible    css=.inventory_list. //assertion
    #Location Should Be    https://www.saucedemo.com/inventory.html //assertion
    Location Should Contain   inventory.html

login with invalide credential
    Open Browser    ${URL}    ${BROWSER} 
    Input Text    id=user-name    standard
    Input Text    id=password    secret_sauce
    Click Button    id=login-button
    #Element Should Be Visible    css=[data-test="error"]
    Wait Until Element Is Visible    css=[data-test="error"]
    Close Browser

    
