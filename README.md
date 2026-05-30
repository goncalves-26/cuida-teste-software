# CUIDA+ — MVP para Testes de Software

Este projeto contém um MVP simples do sistema **CUIDA+**, criado para executar os testes documentados na Wiki da disciplina **Teste de Software**.

O objetivo principal não é criar um sistema grande, mas sim permitir a execução prática de:

- Testes de API com Postman;
- Testes automatizados de interface com Robot Framework + SeleniumLibrary;
- Geração de evidências para a Wiki e para a entrega da N2 AT1.

## Estrutura do projeto

```text
backend/        API em Node.js/Express
frontend/       Telas HTML do sistema
robot-tests/    Testes automatizados de interface
postman/        Coleção do Postman
evidencias/     Pasta para salvar prints e relatórios
```

## Endpoints da API

Com o backend rodando, a API fica disponível em:

```text
http://localhost:8080
```

Endpoints usados nos testes:

```text
POST /api/usuarios
POST /api/idosos
```

## Telas do frontend

Com o frontend rodando, as telas ficam disponíveis em:

```text
http://localhost:3000/cadastro
http://localhost:3000/idosos/novo
```

## Ordem de execução

### 1. Rodar o backend

Abra um terminal na pasta `backend` e execute:

```bash
npm install
npm start
```

### 2. Rodar o frontend

Abra outro terminal na pasta `frontend` e execute:

```bash
npm install
npm start
```

### 3. Executar testes de API

Importe no Postman o arquivo:

```text
postman/CUIDA.postman_collection.json
```

Depois execute as requisições com o backend rodando.

### 4. Executar testes de interface

Instale as dependências Python:

```bash
pip install -r robot-tests/requirements.txt
```

Depois, com backend e frontend rodando, entre na pasta `robot-tests` e execute:

```bash
robot cadastro_usuario.robot
robot cadastro_idoso.robot
```

Os relatórios serão gerados na pasta `robot-tests`:

```text
report.html
log.html
output.xml
```

## Observação

As evidências devem ser registradas depois da execução real dos testes. Não foram adicionados resultados fictícios ao projeto.
