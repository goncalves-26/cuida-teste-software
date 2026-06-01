*** Settings ***
Library    SeleniumLibrary
Suite Setup       Abrir tela de login
Suite Teardown    Fechar navegador
Test Teardown     Recarregar pagina
*** Variables ***
${URL}              http://localhost:3000/login
${BROWSER}          chrome
${INPUT_EMAIL}      id=email
${INPUT_SENHA}      id=senha
${BOTAO_ENTRAR}     id=btnEntrar
${MENSAGEM}         id=mensagem
*** Test Cases ***
CT-UI-LOGIN-01 - Login com credenciais válidas
    Preencher login    familiar@email.com    12345678
    Solicitar login
    Validar mensagem    Login realizado com sucesso
CT-UI-LOGIN-02 - Login com credenciais inválidas
    Preencher login    familiar@email.com    87654321
    Solicitar login
    Validar mensagem    Credenciais inválidas
CT-UI-LOGIN-03 - E-mail inválido
    Preencher login    familiaremail.com    12345678
    Solicitar login
    Validar mensagem    E-mail inválido
CT-UI-LOGIN-04 - Senha inválida
    Preencher login    familiar@email.com    123
    Solicitar login
    Validar mensagem    Senha inválida
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
