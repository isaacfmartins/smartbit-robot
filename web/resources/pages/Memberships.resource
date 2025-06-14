*** Settings ***
Documentation     Ações e elementos da Página de Matrículas
Library          Browser

*** Keywords ***
Create new membership
    [Arguments]    ${data}
    Go to memberships form    
    Select Account    ${data['account']['name']}    ${data['account']['cpf']}  
    Select Plan    ${data['plan']['name']}
    Fill payment card   ${data['credit_card']}
    Click    css=button[type=submit] >> text=Cadastrar

Go to memberships form
    [Documentation]    Navega para a página de novas adesões
    Click    css=a[href="/memberships/new"]

    Wait For Elements State
    ...    css=h1 >> text=Nova matrícula
    ...    visible    5

Select Account
    [Arguments]    ${name}    ${cpf}
    [Documentation]    Seleciona uma conta pelo nome
    Type Text    css=input[aria-label=select_account]    ${name}
    Click        css=[data-testid='${cpf}']

Select Plan
    [Arguments]    ${plan}
    [Documentation]    Seleciona um plano pelo nome
    Type Text    css=input[aria-label=select_plan]    ${plan}
    Click        css=div[id*=option] >> text=${plan}

Fill payment card
    [Arguments]    ${card}
    [Documentation]    Insere os dados do cartão de crédito
    Type Text    id=card_number    ${card}[number]
    Type Text    id=card_holder    ${card}[name]
    Type Text    id=card_month     ${card}[month]
    Type Text    id=card_year      ${card}[year]
    Type Text    id=card_cvv       ${card}[cvv]

Search by name
    [Arguments]    ${name}
    [Documentation]    Busca uma conta pelo nome
    ${elemment}    Set Variable   css=input[placeholder="Busque por nome"]
    Wait For Elements State
    ...    ${elemment}
    ...    visible    5
    Fill Text    ${elemment}    ${name}
    Wait For Elements State
    ...    css=strong >> text=Total: 1
    ...    visible    5
    
Souuld filter by name
    [Arguments]    ${text}
    [Documentation]    Valida se a tabela possui o texto esperado
    ${element}    Set Variable    css=table tbody tr >> text=${text}
    Wait For Elements State
    ...    ${element}
    ...    visible    5
    Get Text    ${element}
    ...    equal
    ...    ${text}  
    

Remove Membership
    [Arguments]    ${digit_card}
    [Documentation]    Remove uma adesão pelo nome
    ${element_remove}    Set Variable    xpath=//td[text()='${digit_card}']/..//button
    
    
    Wait For Elements State
    ...    ${element_remove}
    ...    visible    5
    
    Click    ${element_remove}

   