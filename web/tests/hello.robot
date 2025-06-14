*** Settings ***
Documentation     Hello Robot
Library    String

*** Variables ***
${cpf_formatado}    237.138.124-11

*** Test Cases ***
Deve mostrar mensagem de boas vindas
    [Documentation]    Este teste deve mostrar uma mensagem de boas vindas
    Log    Olá, Robot Framework!

  