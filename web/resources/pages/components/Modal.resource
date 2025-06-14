*** Settings ***
Documentation   Ações e elementos do Modal de exclusão
Library          Browser

*** Keywords ***
Confirm removal
    [Documentation]    Confirma a remoção de um item no modal
    ${element}    Set Variable    css=button.swal2-confirm
    
    Wait For Elements State
    ...    ${element}
    ...    visible    5
    
    Click    ${element}