*** Settings ***
Documentation     Cadastro de Usuário
Resource        ../resources/Base.resource
Library           String

Test Setup    Open Signup Page
Test Teardown    Take Screenshot

*** Variables ***
${Element}        ${EMPTY}




*** Test Cases ***
# Deve iniciar o cadastro do cliente
#     [Documentation]    Este teste deve realizar o cadastro de um usuário com sucesso
   

#     ${account}    Get Fake Account
#     ${cpf}    Remove String    ${account['cpf']}    .-    ${EMPTY}
        

#     Submit signup form    ${account}

#     Verify wellcome message

Deve iniciar o cadastro do cliente
    [Documentation]    Este teste deve realizar o cadastro de um usuário com sucesso
    [Tags]    valid

    ${account}    Create Dictionary
    ...    name=Maria da Silva
    ...    email=test_robot@test.com
    ...    cpf=16858475443    
        
    Delete Account By Email    ${account['email']}
    Submit signup form    ${account}
    Verify wellcome message

 Deve validar usuário já cadastrado
    [Documentation]    Este teste deve verificar se o usuário já está cadastrado
    [Tags]    invalid

    ${account}    Create Dictionary
    ...    name=Emily Stone
    ...    email=emily@hotmail.com
    ...    cpf=516.767.278-33        
   
    Submit signup form    ${account}
    Toast should be
    ...    O e-mail fornecido já foi cadastrado!
    
    
# Campo nome deve ser obrigatório
#     [Documentation]    Este teste deve verificar se o campo nome é obrigatório 
#     [Tags]    required 
    
#     ${account}   Create Dictionary
#     ...    name=${EMPTY}
#     ...    email=teste123@teste.com
#     ...    cpf=16858475443

       

#     Submit signup form    ${account}

#     Notice should be
#     ...    Por favor informe o seu nome completo
    
    
# Campo email deve ser obrigatório
#     [Documentation]    Este teste deve verificar se o campo nome é obrigatório   

#     [Tags]    required

#     ${account}   Create Dictionary
#     ...    name=Maria da Silva
#     ...    email=${EMPTY}
#     ...    cpf=16858475443

      

#     Submit signup form    ${account}

#     Notice should be
#     ...    Por favor, informe o seu melhor e-mail
    

# Campo cpf deve ser obrigatório
#     [Documentation]    Este teste deve verificar se o campo nome é obrigatório   

#     [Tags]    required

#     ${account}   Create Dictionary
#     ...    name=Maria da Silva
#     ...    email=teste123@test.com
#     ...    cpf=${EMPTY}

       

#     Submit signup form    ${account}

#     Notice should be
#     ...    Por favor, informe o seu CPF
    

# Email no formato inválido
#     [Documentation]    Este teste deve verificar se o email informado é válido   

#     [Tags]    invalid

#      ${account}   Create Dictionary
#     ...    name=Maria da Silva
#     ...    email=teste123*test.com
#     ...    cpf=16858475443

      

#     Submit signup form    ${account}   

#     Notice should be
#     ...    Oops! O email informado é inválido
    

# CPF no formato inválido
#     [Documentation]    Este teste deve verificar se o CPF informado é válido   

#     [Tags]    invalid

#     ${account}   Create Dictionary
#     ...    name=Maria da Silva
#     ...    email=teste123@test.com
#     ...    cpf=12345678901

       

#     Submit signup form    ${account}

#     Notice should be
#     ...    Oops! O CPF informado é inválido

Tentativa de pré-cadastro
    [Template]    Attempt signup
    [Documentation]    Tenta realizar o pré-cadastro de um usuário com os dados informados
    [Tags]    invalid   
    ${EMPTY}       ${EMPTY}             ${EMPTY}      Por favor informe o seu nome completo
    ${EMPTY}       teste123@teste.com   16858475443   Por favor informe o seu nome completo
    Maria Silva    ${EMPTY}             16858475443   Por favor, informe o seu melhor e-mail
    Maria Silva    teste123@teste.com   ${EMPTY}      Por favor, informe o seu CPF
    Maria Silva    teste123%teste.com   16858475443   Oops! O email informado é inválido
    Maria Silva    teste123%teste       16858475443   Oops! O email informado é inválido
    Maria Silva    teste123@teste.com   1685847544@   Oops! O CPF informado é inválido
    Maria Silva    teste123@teste.com   1685847544    Oops! O CPF informado é inválido



    

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}
    [Documentation]    Tenta realizar o cadastro de um usuário com os dados informados
    ${account}    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}
    Submit signup form    ${account}
    Notice should be    ${output_message}
