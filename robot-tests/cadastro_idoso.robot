*** Settings ***
Library    SeleniumLibrary

Suite Setup       Abrir tela de cadastro de idoso
Suite Teardown    Fechar navegador
Test Teardown     Recarregar pagina

*** Variables ***
${URL}                  http://localhost:3000/idosos/novo
${BROWSER}              chrome
${INPUT_NOME}           id=nome
${INPUT_IDADE}          id=idade
${INPUT_RESPONSAVEL}    id=responsavelId
${INPUT_OBSERVACOES}    id=observacoes
${BOTAO_CADASTRAR}      id=btnCadastrar
${MENSAGEM}             id=mensagem

*** Test Cases ***
CT-UI-03.1 - Cadastro com idade abaixo do limite
    Preencher cadastro de idoso    José Carlos    59    1    Teste com idade abaixo do limite
    Solicitar cadastro
    Validar mensagem    Idade mínima inválida

CT-UI-03.2 - Cadastro com idade no limite permitido
    Preencher cadastro de idoso    José Carlos    60    1    Teste com idade no limite permitido
    Solicitar cadastro
    Validar mensagem    Idoso cadastrado com sucesso

CT-UI-03.3 - Cadastro com idade acima do limite permitido
    Preencher cadastro de idoso    Maria Helena    61    1    Teste com idade acima do limite permitido
    Solicitar cadastro
    Validar mensagem    Idoso cadastrado com sucesso

CT-UI-03.4 - Cadastro sem nome
    Preencher cadastro de idoso    ${EMPTY}    60    1    Teste com nome vazio
    Solicitar cadastro
    Validar mensagem    Nome obrigatório

*** Keywords ***
Abrir tela de cadastro de idoso
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_NOME}    10s

Recarregar pagina
    Go To    ${URL}
    Wait Until Element Is Visible    ${INPUT_NOME}    10s

Preencher cadastro de idoso
    [Arguments]    ${nome}    ${idade}    ${responsavel}    ${observacoes}
    Clear Element Text    ${INPUT_NOME}
    Input Text    ${INPUT_NOME}    ${nome}
    Clear Element Text    ${INPUT_IDADE}
    Input Text    ${INPUT_IDADE}    ${idade}
    Clear Element Text    ${INPUT_RESPONSAVEL}
    Input Text    ${INPUT_RESPONSAVEL}    ${responsavel}
    Clear Element Text    ${INPUT_OBSERVACOES}
    Input Text    ${INPUT_OBSERVACOES}    ${observacoes}

Solicitar cadastro
    Click Button    ${BOTAO_CADASTRAR}

Validar mensagem
    [Arguments]    ${texto_esperado}
    Wait Until Element Is Visible    ${MENSAGEM}    10s
    Wait Until Element Contains    ${MENSAGEM}    ${texto_esperado}    10s
Fechar navegador
    Close Browser