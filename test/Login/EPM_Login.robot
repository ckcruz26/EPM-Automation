*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/
${browserName}        Chrome
${personnelUN}        12456
${personnelPW}        P@ssw0rd


*** Test Cases ***
[ EPM_LOGIN_001] 
    [Tags]     EPM_LOGIN_001
    Open WebApp using Chrome
    InputValue    ${personnelUN}    ${personnelPW}
    Click Login Button
    Sleep     2
    Close Browser
[EPM_LOGIN_002]
    [Tags]    EPM_LOGIN_002
    Open WebApp using Chrome
    InputValue    12456   ASDASDADS
    Click Login Button
    Sleep     2
    Element Text Should Be     xpath=//*[@id="modalDynamicMessage"]         Oops! Invalid Credentials. Please contact Personnel Section for further assistance in verifying your information.
    Close Browser
[EPM_LOGIN_003]
    [Tags]   EPM_LOGIN_003
    Open WebApp using Chrome
    InputValue    6666    ${personnelPW}
    Click Login Button
    Sleep      2
    Element Text Should Be    xpath=//*[@id="modalDynamicMessage"]    Oops! Invalid Credentials. Please contact Personnel Section.
    Close Browser
[EPM_LOGIN_004]
    [Tags]   EPM_LOGIN_004
    Open WebApp using Chrome
    InputValue      ${personnelUN},     ${EMPTY}
    Click Login Button
    Sleep    2
    Close Browser
[EPM_LOGIN_005]
    [Tags]  EPM_LOGIN_005
    Open WebApp using Chrome
    InputValue       ${EMPTY},       ${personnelPW}
    Click Login Button
    Sleep    2
    Close Browser
[EPM_LOGIN_006]
    [Tags]     EPM_LOGIN_006
    Open WebApp using Chrome
    Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[1]/label/a
    Sleep     2
    Close Browser
[EPM_LOGIN_007]
    [Tags]     EPM_LOGIN_007
    Open WebApp using Chrome
    Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[2]/label/a
    Sleep     2
    Close Browser
    
[EPM_LOGIN_008]
    [Tags]     EPM_LOGIN_008
    Open WebApp using Chrome
    Click Link    xpath=/html/body/div[2]/div/div/section/div/div[2]/div/div[3]/label/a
    Sleep     2
    Close Browser


*** Keywords ***
Open WebApp using Chrome
    Open Browser    ${baseURL}    ${browserName}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
InputValue
    [Arguments]    ${username}    ${password}
    Input Text    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[1]/div/input[2]    ${username}
    Input Password    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[2]/input    ${password}
Click Login Button
    Click Button    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[4]/div/button


