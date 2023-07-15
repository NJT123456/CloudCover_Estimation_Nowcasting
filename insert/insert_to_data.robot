*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser to test
Suite Teardown    Close All Browsers

*** Variables ***
${SERVER}              http://127.0.0.1:8000/
${BROWSER}             chrome
${DELAY}               1
${ESTIMATE URL}           ${SERVER}/estimate
${IMAGE DATA}            ${SERVER}/viewcci

*** Test Cases ***
Choose true picture
    Select true Picture
    Click Button    id=insertBtn
    Handle Alert    ACCEPT    timeout=5s
    viewcci page Should be Open

*** Keywords ***
Open Browser to test
    Open Browser    ${ESTIMATE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Select true Picture
    Choose File    id=image    C://Users//USER//Desktop//test//picture test//2021_11_16__11_16_20_HDR.jpg
    Click Button    id=predict

viewcci page Should be Open
    Go To    ${IMAGE DATA}

