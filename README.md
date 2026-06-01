# CUIDA+ — Teste de Software

Projeto acadêmico da disciplina **Teste de Software**, desenvolvido para apoiar a documentação e execução dos testes da atividade **N2 AT1** e da entrega final do projeto.

O sistema **CUIDA+** tem como tema o cuidado familiar compartilhado da saúde de idosos.

## Funcionalidades disponíveis

- Cadastro de usuário/familiar responsável;
- Login simples;
- Cadastro de idoso;
- Consulta/listagem de idosos;
- Cadastro de medicamentos;
- Registro de cuidados;
- Resumo geral do sistema.

## Como executar

Backend:

```bash
cd backend
npm install
node server.js
```

Frontend:

```bash
cd frontend
npm install
node server.js
```

## Telas

```text
http://localhost:3000/cadastro
http://localhost:3000/login
http://localhost:3000/idosos/novo
http://localhost:3000/idosos
http://localhost:3000/medicamentos/novo
http://localhost:3000/cuidados/novo
```

## Endpoints

```text
POST /api/usuarios
GET  /api/usuarios
POST /api/login
POST /api/idosos
GET  /api/idosos
POST /api/medicamentos
GET  /api/medicamentos
POST /api/cuidados
GET  /api/cuidados
GET  /api/relatorios/resumo
```

## Testes

Collections do Postman:

```text
postman/CUIDA.postman_collection_corrigida.json
postman/CUIDA.postman_collection_ampliada.json
```

Testes Robot Framework:

```bash
cd robot-tests
python -m robot cadastro_usuario.robot
python -m robot cadastro_idoso.robot
python -m robot login.robot
python -m robot medicamentos.robot
python -m robot cuidados.robot
python -m robot lista_idosos.robot
```
