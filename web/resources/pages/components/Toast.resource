*** Settings ***
Documentation     Ações e elementos do Toast
Library          Browser

*** Keywords ***
Toast should be
    [Arguments]    ${expected_text}
    [Documentation]    Valida se a conta foi criada com sucesso

    ${element}    Set Variable    .Toastify__toast-body

    Wait For Elements State
    ...    css=${element} 
    ...    visible    5

    Get Text    css=${element}
    ...    equal
    ...    ${expected_text}
    ...    
    Take Screenshot    selector=${element}