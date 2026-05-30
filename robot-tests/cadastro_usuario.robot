*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Suite Setup       Abrir tela de cadastro
Suite Teardown    Fechar navegador
Test Teardown     Recarregar pagina

*** Variables ***
${URL}                  http://localhost:3000/cadastro
${BROWSER}              chrome
${INPUT_NOME}           id=nome
${INPUT_EMAIL}          id=email
${INPUT_SENHA}          id=senha
${INPUT_CONFIRMAR}      id=confirmarSenha
${BOTAO_CADASTRAR}      id=btnCadastrar
${MENSAGEM}             id=mensagem

*** Test Cases ***
CT-UI-01.1 - Cadastro com dados válidos
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    Preencher cadastro    Ana Paula    ana${timestamp}@email.com    12345678    12345678
    Solicitar cadastro
    Validar mensagem    Usuário cadastrado com sucesso

CT-UI-01.2 - Nome obrigatório
    Preencher cadastro    ${EMPTY}    ana@email.com    12345678    12345678
    Solicitar cadastro
    Validar mensagem    Nome obrigatório

CT-UI-01.3 - Email inválido
    Preencher cadastro    Ana Paula    anaemail.com    12345678    12345678
    Solicitar cadastro
    Validar mensagem    E-mail inválido

CT-UI-01.4 - Senha inválida
    Preencher cadastro    Ana Paula    ana@email.com    123    123
    Solicitar cadastro
    Validar mensagem    Senha inválida

CT-UI-01.5 - Senhas diferentes
    Preencher cadastro    Ana Paula    ana@email.com    12345678    87654321
    Solicitar cadastro
    Validar mensagem    Senhas diferentes

*** Keywords ***
Abrir tela de cadastro
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_NOME}    10s

Recarregar pagina
    Go To    ${URL}
    Wait Until Element Is Visible    ${INPUT_NOME}    10s

Preencher cadastro
    [Arguments]    ${nome}    ${email}    ${senha}    ${confirmar}
    Clear Element Text    ${INPUT_NOME}
    Input Text    ${INPUT_NOME}    ${nome}
    Clear Element Text    ${INPUT_EMAIL}
    Input Text    ${INPUT_EMAIL}    ${email}
    Clear Element Text    ${INPUT_SENHA}
    Input Password    ${INPUT_SENHA}    ${senha}
    Clear Element Text    ${INPUT_CONFIRMAR}
    Input Password    ${INPUT_CONFIRMAR}    ${confirmar}

Solicitar cadastro
    Click Button    ${BOTAO_CADASTRAR}

Validar mensagem
    [Arguments]    ${texto_esperado}
    Wait Until Element Is Visible    ${MENSAGEM}    10s
    Wait Until Element Contains    ${MENSAGEM}    ${texto_esperado}    10s

Fechar navegador
    Close Browser