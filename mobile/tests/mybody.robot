*** Settings ***
Documentation     Ações e elementos da página Mybody
Resource          ../resources/Base.resource
Library    ../../libs/DataBase.py

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Deve cadastrar minhas medidas
    [Documentation]    Atualização de dados das medidas
    [Tags]    update
    ${data}    Get Json fixture    update
    Insert Membership    ${data}

    Sign with document    ${data['account']['cpf']}
    User is logged in
    Touch my body
    Send weight and height    ${data['account']}
    Popup have text    Seu cadastro foi atualizado com sucesso

    Set user token
    ${account}    Get account by name    ${data}[account][name]
    
    Should Be Equal    ${account}[weight]    ${data}[account][weight] 
    Should Be Equal    ${account}[height]    ${data}[account][height]




