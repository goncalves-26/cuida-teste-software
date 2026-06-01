*** Settings ***
Library    SeleniumLibrary

Suite Setup       Abrir tela de login
Suite Teardown    Fechar navegador
Test Teardown     Recarregar pagina

*** Variables ***
${URL}               http://localhost:3000/login
${BROWSER}           chrome
${INPUT_EMAIL}       id=email
${INPUT_SENHA}       id=senha
${BOTAO_ENTRAR}      xpath=//button[@type='submit']
${MENSAGEM}          id=mensagem

*** Test Cases ***
CT-UI-LOGIN-01 - Usuário não encontrado
    Preencher login    inexistente@email.com
    ...    12345678
    Solicitar login
    Validar mensagem    Usuário não encontrado

CT-UI-LOGIN-02 - Login com usuário existente
    Preencher login    ana@email.com
    ...    12345678
    Solicitar login
    Validar mensagem    Login realizado com sucesso

*** Keywords ***
Abrir tela de login
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_EMAIL}    10s

Recarregar pagina
    Go To    ${URL}
    Wait Until Element Is Visible    ${INPUT_EMAIL}    10s

Preencher login
    [Arguments]    ${email}    ${senha}
    Clear Element Text    ${INPUT_EMAIL}
    Input Text    ${INPUT_EMAIL}    ${email}
    Clear Element Text    ${INPUT_SENHA}
    Input Password    ${INPUT_SENHA}    ${senha}

Solicitar login
    Click Button    ${BOTAO_ENTRAR}

Validar mensagem
    [Arguments]    ${texto_esperado}
    Wait Until Element Is Visible    ${MENSAGEM}    10s
    Wait Until Element Contains    ${MENSAGEM}    ${texto_esperado}    10s

Fechar navegador
    Close Browser