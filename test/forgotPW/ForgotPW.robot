*** Settings ***
Library        SeleniumLibrary
Library        ../../.venv/Lib/site-packages/robot/libraries/XML.py

*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/forgot/forgot_password.php
${browserName}        Edge

*** Test Cases ***

[EPM_FORGOT_PW_001]
    [Tags]     EPM_FORGOT_PW_001
    TRY
        Open WebApp using Edge
        InputValue     12456    cruzchristiankeirre7675@gmail.com      
        Click Submit Button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_002]
    [Tags]     EPM_FORGOT_PW_002
    TRY
        Open WebApp using Edge
        InputValue     ${EMPTY}    cruzchristiankeirre7675@gmail.com      
        Click Submit Button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_003]
    [Tags]    EPM_FORGOT_PW_003
    TRY
        Open WebApp using Edge
        InputValue     12456        ${EMPTY}    
        Click Submit Button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_005]
    [Tags]    EPM_FORGOT_PW_005
    TRY
        Open WebApp using Edge
        InputValue     12456        ASDADSADASD@gmail.com     
        Click Submit Button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_FORGOT_PW_006]
    [Tags]    EPM_FORGOT_PW_006
    TRY
        Open WebApp using Edge
        InputValue     99999        cruzchristiankeirre7675@gmail.com      
        Click Submit Button
        Sleep     5
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

*** Keywords ***

Open WebApp using Edge
    Open Browser    ${baseURL}    ${browserName}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window

InputValue
    [Arguments]    ${username}    ${email}
    Input Text    xpath=//*[@id="empno"]     ${username}
    Input Text    xpath=//*[@id="email"]     ${email}

Click Submit Button
    Click Button    xpath=/html/body/div[2]/div[2]/form/div[4]/div/button
