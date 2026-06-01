*** Settings ***
Library    SeleniumLibrary
Suite Setup       Abrir lista de idosos
Suite Teardown    Fechar navegador
Test Teardown     Recarregar pagina
*** Variables ***
${URL}              http://localhost:3000/idosos
${BROWSER}          chrome
${INPUT_BUSCA}      id=busca
${BOTAO_BUSCAR}     id=btnBuscar
${BOTAO_LISTAR}     id=btnListarTodos
${MENSAGEM}         id=mensagem
${LISTA}            id=lista
*** Test Cases ***
CT-UI-LISTA-01 - Listar idosos cadastrados
    Click Button    ${BOTAO_LISTAR}
    Validar mensagem    Idosos encontrados
    Wait Until Element Contains    ${LISTA}    José Carlos    10s
CT-UI-LISTA-02 - Buscar idoso existente
    Clear Element Text    ${INPUT_BUSCA}
    Input Text    ${INPUT_BUSCA}    José
    Click Button    ${BOTAO_BUSCAR}
    Validar mensagem    Idosos encontrados
    Wait Until Element Contains    ${LISTA}    José Carlos    10s
CT-UI-LISTA-03 - Buscar idoso inexistente
    Clear Element Text    ${INPUT_BUSCA}
    Input Text    ${INPUT_BUSCA}    NomeInexistente
    Click Button    ${BOTAO_BUSCAR}
    Validar mensagem    Nenhum idoso encontrado
*** Keywords ***
Abrir lista de idosos
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_BUSCA}    10s
Recarregar pagina
    Go To    ${URL}
    Wait Until Element Is Visible    ${INPUT_BUSCA}    10s
Validar mensagem
    [Arguments]    ${texto_esperado}
    Wait Until Element Is Visible    ${MENSAGEM}    10s
    Wait Until Element Contains    ${MENSAGEM}    ${texto_esperado}    10s
Fechar navegador
    Close Browser
