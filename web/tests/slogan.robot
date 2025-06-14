*** Settings ***
Documentation     Testes para verificar o Slogan da Smartbit
Library           Browser
*** Test Cases ***
Deve exibir o Slogan da Smartbit
    [Documentation]    Este teste deve verificar se o slogan da Smartbit é exibido corretamente
    New Browser    chromium    headless=false
    New Page    http://localhost:3000/
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui!