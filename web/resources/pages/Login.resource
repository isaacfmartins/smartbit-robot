*** Settings ***
Documentation     Ações e elementos do Login
Variables        ../Env.py
Library          Browser

*** Keywords ***

Go to login page
    [Documentation]    Navega para a página de login    

    New Page   ${BASE_URL}/login

Submit login form   
    [Arguments]    ${email}    ${password}
    [Documentation]    Preenche e envia o formulário de login
    Fill Text    id=email    ${email}
    Fill Text    id=password    ${password}
    Click    css=button >> text=Entrar

