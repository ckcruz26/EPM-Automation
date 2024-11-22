*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${baseURL}            https://172.31.32.64/registration_pilot/
${browserName}        Chrome




*** Keywords ***
Open WebApp using Chrome
    Open Browser    ${baseURL}    ${browserName}    options=add_argument("--ignore-certificate-errors")
    Maximize Browser Window
# InputValue
#     [Arguments]    ${username}    ${password}
#     Input Text    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[1]/div/input[2]    ${username}
#     Input Password    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[2]/input    ${password}
# Click Login Button
#     Click Button    xpath=/html/body/div[2]/div/div/section/div/div[2]/form/div[4]/div/button
