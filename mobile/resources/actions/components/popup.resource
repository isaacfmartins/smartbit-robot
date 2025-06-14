*** Settings ***
Documentation    Ações e elementos da componente de Popup.
Library    AppiumLibrary

*** Keywords ***
Popup have text
    [Documentation]    Verifica se o popup contém o texto esperado.
    [Arguments]    ${message}
    ${element}    Set Variable    //android.widget.TextView[@resource-id="android:id/message"]    
    Wait Until Element Is Visible    ${element}    10
    Element Text Should Be    ${element}    ${message}
    
Close alert
    ${confirmAlert}    Set Variable    //android.widget.Button[@resource-id="android:id/button1"]
    Click Element    ${confirmAlert}