*** Settings ***

Test Template    login to saucedemo
Library    SeleniumLibrary
Library    DataDriver    jdd.csv    dialect=excel    encoding=UTF-8

*** Variables ***

${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${TITLE}    Swag Labs


*** Test Cases ***

login with jdd
    

*** Keywords ***

login to saucedemo
    Open Browser    ${URL}    ${BROWSER}
    [Arguments]    ${username}    ${password}    ${expected_result}
    Input Text    id=user-name    ${username}
    Input Text    id=password    ${password}
    Click Button    id=login-button
    Run Keyword If    '${expected_result}' == 'success'    Verify Login Success
    Run Keyword If    '${expected_result}' == 'error'    Verify Login Error
    Close Browser
    
Verify Login Success
    Location Should Contain    inventory.html    timeout=10s
    Title Should Be    ${TITLE}

Verify Login Error
    Wait Until Element Is Visible    css=[data-test="error"]    timeout=10s

