# CUIDA+ — Teste de Software

Projeto acadêmico da disciplina **Teste de Software**, desenvolvido para apoiar a documentação e execução dos testes da atividade 

O sistema **CUIDA+** tem como tema o cuidado familiar compartilhado da saúde de idosos.

## Objetivo

Este repositório contém um MVP simples utilizado para executar:

* testes de API com Postman;
* testes automatizados de interface com Robot Framework e SeleniumLibrary;
* evidências dos testes documentados na Wiki.

A documentação principal do trabalho está disponível na aba **Wiki** deste repositório.

## Estrutura do projeto

```text
backend/            API em Node.js/Express
frontend/           Telas do sistema
postman/            Collection dos testes de API
robot-tests/        Testes automatizados de interface
teste evidencias/   Prints e evidências dos testes
```

## Como executar o sistema

### 1. Back-end

Abra um terminal na pasta `backend` e execute:

```bash
npm install
npm start
```

A API ficará disponível em:

```text
http://localhost:8080
```

### 2. Front-end

Abra outro terminal na pasta `frontend` e execute:

```bash
npm install
npm start
```

O sistema ficará disponível em:

```text
http://localhost:3000
```

## Testes de API

Os testes de API foram executados no **Postman**.

Collection utilizada:

```text
postman/CUIDA.postman_collection_corrigida.json
```

Endpoints testados:

```text
POST /api/usuarios
POST /api/idosos
```

Testes documentados na Wiki:

* CT-API-01 — Cadastro de usuário;
* CT-API-03 — Cadastro de idoso.

## Testes de interface

Os testes de interface foram executados com **Robot Framework** e **SeleniumLibrary**.

Para instalar as dependências:

```bash
python -m pip install -r robot-tests/requirements.txt
```

Para executar os testes, mantenha o back-end e o front-end rodando. Depois, entre na pasta `robot-tests` e execute:

```bash
python -m robot cadastro_usuario.robot
python -m robot cadastro_idoso.robot
```

Testes documentados na Wiki:

* CT-UI-01 — Cadastro de usuário pela interface;
* CT-UI-03 — Cadastro de idoso pela interface.

## Evidências

As evidências dos testes estão na pasta:

```text
teste evidencias/
```

As páginas da Wiki apresentam a modelagem, implementação, execução e resultados dos testes.

## Observação

Este projeto possui finalidade acadêmica e foi desenvolvido para demonstrar a aplicação prática de técnicas de teste de software.

