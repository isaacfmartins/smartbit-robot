*** Settings ***
Documentation     Cena de teste para login
Resource          ../resources/Base.resource

Test Setup    Open Signup Page
Test Teardown    Take Screenshot



*** Test Cases ***
 Deve logar com o Gestor da Academia
    [Documentation]    Teste de login com sucesso
    [Tags]    login
    Go to login page
    ${account}    Get Manager Account
    Submit login form    ${account['email']}    ${account['password']}
    User is logged in   sac@smartbit.com

Não deve logar com email incorreto
    [Documentation]    Teste de login com email incorreto
    [Tags]    invalid_login
    Go to login page
    ${account}    Get Manager Account
    Submit login form    teste@test.com   ${account['password']}
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente!  

Não deve logar com senha incorreta
    [Documentation]    Teste de login com senha incorreta
    [Tags]    invalid_login
    Go to login page
    ${account}    Get Manager Account
    Submit login form    ${account['email']}    123456
    Toast should be    As credenciais de acesso fornecidas são inválidas. Tente novamente! 

Tentativa de Login    
    [Documentation]    Teste de login com email e senha incorretos
    [Template]    login with verify notice
    [Tags]    invalid_login
    ${EMPTY}            ${EMPTY}     Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123       Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}     Os campos email e senha são obrigatórios.
    teste#teste.com     pwd123       Oops! O email informado é inválido
    @$*&¨%&876867876    pwd123       Oops! O email informado é inválido
    yahoo@$com          pwd123       Oops! O email informado é inválido

*** Keywords ***
login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}
    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be   ${output_message}