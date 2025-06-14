*** Settings ***
Documentation     Ações e elementos da Página de Boas Vindas
Library          Browser

*** Keywords ***
Verify wellcome message
      Wait For Elements State
      ...    text=Falta pouco para fazer parte da família Smartbit!
      ...    visible    5