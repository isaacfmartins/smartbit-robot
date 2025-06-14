*** Settings ***
Documentation    Ações e elementos da página de MyBody
Library    AppiumLibrary

*** Keywords ***
Send weight and height
    [Arguments]    ${account}
    Wait Until Page Contains    Registre ou atualize suas medidas   5
    Input Text    xpath=//android.widget.EditText[@resource-id="weight"]    ${account}[weight]
    Input Text    xpath=//android.widget.EditText[@resource-id="height"]    ${account}[height]
    Click Element    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]
    