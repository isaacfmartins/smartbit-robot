*** Settings ***
Documentation    Arquivo para testar o consumo da API com Tasks
Resource          ./Service.resource

*** Tasks ***
Testando a API
    Set user token
    Get account by name    Paloma Silva
