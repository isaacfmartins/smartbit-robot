*** Settings ***
Documentation    Suite de testes de login
Resource          ../resources/Base.resource
Library    ../../libs/DataBase.py

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Deve logar com IP e CPF
    [Tags]    succeess_login
    ${data}    Get Json fixture   login
    Insert Membership   ${data}
    Sign with document    ${data['account']['cpf']} 
    User is logged in

# Não deve logar com CPF não cadastrado
#     [Tags]    smoke
#     Sign with document    36953684208
#     Popup have text    Acesso não autorizado! Entre em contato com a central de atendimento

# Não deve logar com CPF inválido
#     [Tags]    smoke
#     Sign with document    ${EMPTY}
#     Popup have text    CPF inválido, tente novamente

Login attempt
    [Template]    login with verify alert
    [Tags]    invalid_login
    ${EMPTY}            Informe o número do seu CPF
    12345678901         CPF inválido, tente novamente
    36953684208         Acesso não autorizado! Entre em contato com a central de atendimento


*** Keywords ***
login with verify alert
    [Arguments]    ${cpf}    ${output_message}
    Sign with document    ${cpf}
    Popup have text    ${output_message}
    Close alert
    

    