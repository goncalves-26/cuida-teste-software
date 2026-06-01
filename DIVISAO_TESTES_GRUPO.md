# Divisão sugerida de testes para o Grupo 7

Esta divisão ajuda cada integrante a ter testes individuais diferentes usando o mesmo MVP CUIDA+.

## Integrante 1 - Cadastro de usuário e idoso
- API: POST /api/usuarios e POST /api/idosos
- Interface: /cadastro e /idosos/novo

## Integrante 2 - Login
- API: POST /api/login
- Interface: /login
- Testes sugeridos: login válido, credenciais inválidas, e-mail inválido, senha inválida.

## Integrante 3 - Medicamentos
- API: POST /api/medicamentos e GET /api/medicamentos
- Interface: /medicamentos/novo
- Testes sugeridos: medicamento válido, nome obrigatório, dosagem obrigatória, horário obrigatório.

## Integrante 4 - Cuidados
- API: POST /api/cuidados e GET /api/cuidados
- Interface: /cuidados/novo
- Testes sugeridos: cuidado válido, descrição obrigatória, data obrigatória, responsável obrigatório.

## Integrante 5 - Consulta/Listagem
- API: GET /api/idosos, GET /api/idosos?nome=Jose, GET /api/relatorios/resumo
- Interface: /idosos
- Testes sugeridos: listagem, busca existente, busca inexistente, resumo geral.
