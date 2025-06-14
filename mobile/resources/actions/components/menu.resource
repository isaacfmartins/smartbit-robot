*** Settings ***
Documentation    Ações e elementos da componente de Menu.
Library    AppiumLibrary

*** Keywords ***
Touch my account
    Click Element    xpath=//android.widget.TextView[@text="Minha conta"]
Touch my body
    Click Element    xpath=//android.widget.TextView[@text="Meu corpo"]