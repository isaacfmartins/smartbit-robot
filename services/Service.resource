*** Settings *** 
Documentation    Camnda de integração com a API

Library    RequestsLibrary
Variables    Env.py


*** Variables ***
${token}    ${EMPTY}



*** Keywords ***
Set user token
    ${payload}    Create Dictionary
    ...    email=sac@smartbit.com
    ...    password=pwd123
    

    ${resp}    POST    
    ...    url=${API_URL}/sessions
    ...    json=${payload}
    
    ${token}=    Set Variable    Bearer ${resp.json()}[token]
    Set Suite Variable    ${token}

Get account by name
    [Arguments]    ${name} 
    ${headers}=    Create Dictionary 
    ...    Authorization=${token}
    
    ${params}=    Create Dictionary
    ...    name=${name}

    ${resp}    GET    url=${API_URL}/accounts    
    ...    params=${params}    
    ...    headers=${headers}
    
    RETURN    ${resp.json()}[data][0]
    