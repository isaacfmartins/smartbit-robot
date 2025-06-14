*** Settings ***
Documentation     Suite de testes de adesões de planos
Library          Browser
Library          String
Resource         ../resources/Base.resource

Test Setup    Open Signup Page
Test Teardown    Take Screenshot

*** Test Cases ***

Deve poder realizar uma nova adesão
    [Documentation]    Este teste deve realizar uma adesão de plano com sucesso
    [Tags]   cadastro

   

    # ${account}    Create Dictionary
    # ...    name=Eliza da Silva
    # ...    email=eliza_silva@teste.com
    # ...    cpf=34238501594
    
    # ${plan}    Set Variable    Plano Black
    
    # ${credit_card}    Create Dictionary
    # ...    card_number=5041754379451471
    # ...    card_holder=Eliza da Silva
    # ...    card_month=7
    # ...    card_year=2035
    # ...    card_cvv=408
   
    ${data}    Get Json fixture    memberships    create
    
    Delete Account By Email    ${data['account']['email']} 
    Insert Account    ${data['account']}
    
    SignIn admin    
    Go to memberships
    Create new membership    ${data}
    
    Toast should be
    ...    Matrícula cadastrada com sucesso.

Não deve realizar adesão duplicada
    [Documentation]    Este teste deve validar que não é possível realizar uma adesão duplicada
    [Tags]   duplicidade

    ${data}    Get Json fixture    memberships    duplicate    

    Insert Membership    ${data}
    
    SignIn admin    
    Go to memberships
    Create new membership    ${data}    
    Toast should be
    ...    O usuário já possui matrícula.

Deve buscar por nome
    [Documentation]    Este teste deve buscar uma adesão pelo nome do titular
    [Tags]   busca

    ${data}    Get Json fixture    memberships    search
    
    Insert Membership    ${data}
    
    SignIn admin    
    Go to memberships
    Search by name    ${data['account']['name']}
    
    Souuld filter by name    ${data['account']['name']}

Deve excluir a matricula
    [Documentation]    Este teste deve excluir uma adesão
    [Tags]   remove

    ${data}    Get Json fixture    memberships    remove
    
    Insert Membership    ${data}
    
    SignIn admin    
    Go to memberships
    # Search by name    ${data['account']['name']}

    ${digit_card}    Get Substring    ${data['credit_card']['number']}    -4
    
    Remove Membership    ${digit_card}
    Confirm removal
    Toast should be
    ...    Matrícula removida com sucesso.
