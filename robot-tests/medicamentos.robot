*** Settings ***
Library    SeleniumLibrary
Suite Setup       Abrir tela de medicamentos
Suite Teardown    Fechar navegador
Test Teardown     Recarregar pagina
*** Variables ***
${URL}              http://localhost:3000/medicamentos/novo
${BROWSER}          chrome
${INPUT_NOME}       id=nome
${INPUT_DOSAGEM}    id=dosagem
${INPUT_HORARIO}    id=horario
${INPUT_IDOSO}      id=idosoId
${BOTAO}            id=btnCadastrarMedicamento
${MENSAGEM}         id=mensagem
*** Test Cases ***
CT-UI-MED-01 - Medicamento com dados válidos
    Preencher medicamento    Losartana    50mg    08:00    1
    Solicitar cadastro
    Validar mensagem    Medicamento cadastrado com sucesso
CT-UI-MED-02 - Nome do medicamento obrigatório
    Preencher medicamento    ${EMPTY}    50mg    08:00    1
    Solicitar cadastro
    Validar mensagem    Nome do medicamento obrigatório
CT-UI-MED-03 - Dosagem obrigatória
    Preencher medicamento    Losartana    ${EMPTY}    08:00    1
    Solicitar cadastro
    Validar mensagem    Dosagem obrigatória
CT-UI-MED-04 - Horário obrigatório
    Preencher medicamento    Losartana    50mg    ${EMPTY}    1
    Solicitar cadastro
    Validar mensagem    Horário obrigatório
*** Keywords ***
Abrir tela de medicamentos
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_NOME}    10s
Recarregar pagina
    Go To    ${URL}
    Wait Until Element Is Visible    ${INPUT_NOME}    10s
Preencher medicamento
    [Arguments]    ${nome}    ${dosagem}    ${horario}    ${idoso}
    Clear Element Text    ${INPUT_NOME}
    Input Text    ${INPUT_NOME}    ${nome}
    Clear Element Text    ${INPUT_DOSAGEM}
    Input Text    ${INPUT_DOSAGEM}    ${dosagem}
    Clear Element Text    ${INPUT_HORARIO}
    Input Text    ${INPUT_HORARIO}    ${horario}
    Clear Element Text    ${INPUT_IDOSO}
    Input Text    ${INPUT_IDOSO}    ${idoso}
Solicitar cadastro
    Click Button    ${BOTAO}
Validar mensagem
    [Arguments]    ${texto_esperado}
    Wait Until Element Is Visible    ${MENSAGEM}    10s
    Wait Until Element Contains    ${MENSAGEM}    ${texto_esperado}    10s
Fechar navegador
    Close Browser
