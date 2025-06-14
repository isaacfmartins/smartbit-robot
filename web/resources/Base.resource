*** Settings ***

Documentation     Arquivo principal do projeto Robot Framework
Library          Browser
Library          JSONLibrary

Library          ../../libs/Account.py
Library          ../../libs/DataBase.py

Resource        pages/Landing.resource
Resource        pages/Wellcome.resource
Resource        pages/Login.resource
Resource        pages/Accounts.resource
Resource        pages/Memberships.resource

Resource        pages/components/Navbar.resource
Resource        pages/components/Toast.resource
Resource        pages/components/BoxNotice.resource
Resource        pages/components/Modal.resource

*** Variables ***
${url}    http://localhost:3000/


*** Keywords ***
Open Signup Page
    [Documentation]    Abre a página de cadastro
    New Browser    chromium    headless=False
    New Page    ${url}

# Helpers
Get Json fixture
    [Arguments]    ${fixture_name}    ${scenario}
    [Documentation]    Retorna o conteúdo do fixture especificado
    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${fixture_name}.json
    RETURN    ${data}[${scenario}]

SignIn admin
    
    [Documentation]    Realiza o login do usuário administrador
    ${manager_account}    Get Manager Account
    Go to login page
    Submit login form    ${manager_account['email']}    ${manager_account['password']}
    User is logged in    ${manager_account['email']}