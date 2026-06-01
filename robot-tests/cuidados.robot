*** Settings ***
Library    SeleniumLibrary
Suite Setup       Abrir tela de cuidados
Suite Teardown    Fechar navegador
Test Teardown     Recarregar pagina
*** Variables ***
${URL}                http://localhost:3000/cuidados/novo
${BROWSER}            chrome
${INPUT_DESCRICAO}    id=descricao
${INPUT_DATA}         id=data
${INPUT_RESPONSAVEL}  id=responsavel
${INPUT_IDOSO}        id=idosoId
${BOTAO}              id=btnRegistrarCuidado
${MENSAGEM}           id=mensagem
*** Test Cases ***
CT-UI-CUID-01 - Cuidado com dados válidos
    Preencher cuidado    Verificar pressão arterial    2026-06-01    Ana Paula    1
    Solicitar registro
    Validar mensagem    Cuidado registrado com sucesso
CT-UI-CUID-02 - Descrição obrigatória
    Preencher cuidado    ${EMPTY}    2026-06-01    Ana Paula    1
    Solicitar registro
    Validar mensagem    Descrição obrigatória
CT-UI-CUID-03 - Data obrigatória
    Preencher cuidado    Verificar pressão arterial    ${EMPTY}    Ana Paula    1
    Solicitar registro
    Validar mensagem    Data obrigatória
CT-UI-CUID-04 - Responsável obrigatório
    Preencher cuidado    Verificar pressão arterial    2026-06-01    ${EMPTY}    1
    Solicitar registro
    Validar mensagem    Responsável obrigatório
*** Keywords ***
Abrir tela de cuidados
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_DESCRICAO}    10s
Recarregar pagina
    Go To    ${URL}
    Wait Until Element Is Visible    ${INPUT_DESCRICAO}    10s
Preencher cuidado
    [Arguments]    ${descricao}    ${data}    ${responsavel}    ${idoso}
    Clear Element Text    ${INPUT_DESCRICAO}
    Input Text    ${INPUT_DESCRICAO}    ${descricao}
    Clear Element Text    ${INPUT_DATA}
    Input Text    ${INPUT_DATA}    ${data}
    Clear Element Text    ${INPUT_RESPONSAVEL}
    Input Text    ${INPUT_RESPONSAVEL}    ${responsavel}
    Clear Element Text    ${INPUT_IDOSO}
    Input Text    ${INPUT_IDOSO}    ${idoso}
Solicitar registro
    Click Button    ${BOTAO}
Validar mensagem
    [Arguments]    ${texto_esperado}
    Wait Until Element Is Visible    ${MENSAGEM}    10s
    Wait Until Element Contains    ${MENSAGEM}    ${texto_esperado}    10s
Fechar navegador
    Close Browser
