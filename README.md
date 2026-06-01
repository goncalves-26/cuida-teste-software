# CUIDA+ — Teste de Software

Projeto acadêmico da disciplina **Teste de Software**, desenvolvido para apoiar a documentação e execução dos testes da atividade.

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

## Funcionalidades disponíveis

* Cadastro de usuário;
* Cadastro de idoso;
* Login de usuário.

## Testes de API

Os testes de API foram executados no **Postman**.

Endpoints testados:

```text
POST /api/usuarios
POST /api/idosos
POST /api/login
```

Testes documentados:

* CT-API-01 — Cadastro de usuário;
* CT-API-03 — Cadastro de idoso;
* CT-API-LOGIN-01 — Login válido;
* CT-API-LOGIN-02 — Usuário não encontrado.

## Testes de Interface

Os testes de interface foram executados com **Robot Framework** e **SeleniumLibrary**.

Para instalar as dependências:

```bash
python -m pip install -r robot-tests/requirements.txt
```

Para executar os testes:

```bash
python -m robot cadastro_usuario.robot
python -m robot cadastro_idoso.robot
python -m robot login.robot
```

Testes documentados:

* CT-UI-01 — Cadastro de usuário pela interface;
* CT-UI-03 — Cadastro de idoso pela interface;
* CT-UI-LOGIN-01 — Usuário não encontrado;
* CT-UI-LOGIN-02 — Login realizado com sucesso.

## Evidências

As evidências dos testes estão armazenadas na pasta:

```text
teste evidencias/
```

Incluindo:

* evidências de API;
* evidências de interface;
* relatório de execução do Robot Framework.

## Observação

Este projeto possui finalidade acadêmica e foi desenvolvido para demonstrar a aplicação prática de técnicas de teste de software.
