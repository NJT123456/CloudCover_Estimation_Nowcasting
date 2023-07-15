*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser To Welcome to Cloud Cover Nowcasting
Suite Teardown    Close All Browsers

*** Variables ***
${SERVER}              http://127.0.0.1:8000/
${BROWSER}             chrome
${DELAY}               1
${LOGIN URL}           ${SERVER}
${NOWCASTING URL}      ${SERVER}/nowcast

*** Test Cases ***

Login Test valid user and invalid password
    Input Username    admin
    Input Password    1234
    Submit Credentials
    Welcome Page Should Be Open

Login Test invalid user and valid password
    Input Username    tester
    Input Password    123
    Submit Credentials
    Welcome Page Should Be Open

Login Test invalid user and invalid password
    Input Username    tester
    Input Password    1234
    Submit Credentials
    Welcome Page Should Be Open

Login Test valid user and valid password
    Input Username    admin
    Input Password    123
    Submit Credentials
    Welcome Page Should Be Open

*** Keywords ***
Open Browser To Welcome to Cloud Cover Nowcasting
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    id=forecc

Welcome Page Should Be Open
    Wait Until Page Contains    Cloud Cover Nowcasting
    Title Should Be    Cloud Cover Nowcasting
