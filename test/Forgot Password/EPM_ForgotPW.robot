*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/forgot/forgot_password.php
${browserName}        Chrome

*** Test Cases ***

[ EPM_FORGOT_PW_001] 
    [Tags]     EPM_FORGOT_PW_001
    Open WebApp using Chrome
    # Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[2]/label/a
    InputValue     12456    cruzchristiankeirre7675@gmail.com      
    Click Submit Button
    Sleep     5
    Close Browser

[ EPM_FORGOT_PW_002] 
    [Tags]     EPM_FORGOT_PW_002
    Open WebApp using Chrome
    # Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[2]/label/a
    InputValue     ${EMPTY}    cruzchristiankeirre7675@gmail.com      
    Click Submit Button
    Sleep     5
    Close Browser
[EPM_FORGOT_PW_003]
    [Tags]    EPM_FORGOT_PW_003
    Open WebApp using Chrome

*** Keywords ***
Open WebApp using Chrome
    Open Browser    ${baseURL}    ${browserName}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
InputValue
    [Arguments]    ${username}    ${email}
    Input Text    xpath=//*[@id="empno"]     ${username}
    Input Text    xpath=//*[@id="email"]             ${email}
Click Submit Button
     Click Button    xpath=/html/body/div[2]/div[2]/form/div[4]/div/button
