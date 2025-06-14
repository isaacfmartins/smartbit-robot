*** Settings ***
Documentation    Ações e elementos da página de login
Library    AppiumLibrary

*** Variables ***
${IP_ADDRESS}    172.18.48.1


*** Keywords ***
Sign with document
    [Arguments]    ${cpf}
    Input Text    xpath=//android.widget.EditText[@resource-id="ipAddress"]
    ...    ${IP_ADDRESS}
    Input Text    xpath=//android.widget.EditText[@resource-id="cpf"]   ${cpf}
    Click Element    xpath=//android.view.ViewGroup[@resource-id="btnLogin"]

