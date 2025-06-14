*** Settings ***
Documentation     Ações e elementos da do componente BoxNotice
Library          Browser

*** Keywords ***
Notice should be
      [Arguments]    ${target}

      ${Element}    Set Variable    css=form .notice

      Wait For Elements State
      ...    ${Element}
      ...    visible    5
      
      Get Text    ${Element}
      ...    equal
      ...    ${target} 