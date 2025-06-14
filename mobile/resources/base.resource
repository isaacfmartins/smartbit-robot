*** Settings ***
Documentation    Arquivo principal do projeto de automação mobile.
Library    AppiumLibrary
Library    JSONLibrary

Library    ../../libs/Account.py

Resource    ../../services/Service.resource

Resource    ./actions/login.resource
Resource    ./actions/account.resource

Resource    ./actions/mybody.resource
Resource    ./actions/components/menu.resource

Resource    ./actions/components/popup.resource
*** Variables ***
${URL}    http://localhost:4723
${PLATFORM}   Android
${AUTOMATION_NAME}    UiAutomator2
${DEVICE}    Emulator
${UDID}    emulator-5554
${APP}    /app/smartbit-beta.apk

*** Keywords ***
Start session    
    Open Application
    ...    ${URL}
    ...    platformName=${PLATFORM}
    ...    automationName=${AUTOMATION_NAME}
    ...    deviceName=${DEVICE}
    ...    udid=${UDID}
    ...    app=${EXECDIR}${APP}
    ...    autoGrantPermissions=true
    
    
    Wait Until Page Contains    IP da API    30

Finish session
    Capture Page Screenshot
    Close Application

Get Json fixture
    [Arguments]    ${scenario}
    [Documentation]    Retorna o conteúdo do fixture especificado
    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/data.json
    RETURN    ${data}[${scenario}]