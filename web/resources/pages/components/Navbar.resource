*** Settings ***
Documentation   Ações e elementos da barra de navegação
Library          Browser

*** Keywords ***
User is logged in
    [Arguments]    ${target}
    [Documentation]    Valida se a conta foi criada com sucesso

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State
    ...    ${element} 
    ...    visible    5

    Get Text    ${element}
    ...    equal
    ...    ${target}
Go to memberships
    [Documentation]    Navega para a página de adesões
    Click    css=a[href="/memberships"] >> text=Matrículas

    Wait For Elements State
    ...    css=h1 >> text=Matrículas
    ...    visible    5