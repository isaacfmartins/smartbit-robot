*** Settings ***
Documentation    Ações e elementos da página de Account.
Library    AppiumLibrary

*** Keywords ***
User is logged in
    [Documentation]    Verifica se o usuário está logado.
    ${element}    Set Variable    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]
    Wait Until Element Is Visible    ${element}    10
    Element Text Should Be    ${element}    Sua transformação começa aqui!