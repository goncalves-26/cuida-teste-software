const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 8080;

app.use(cors());
app.use(express.json());

let usuarios = [{ id: 1, nome: "Familiar Responsável", email: "familiar@email.com" }];
let idosos = [{ id: 1, nome: "José Carlos", idade: 72, responsavelId: 1, observacoes: "Cadastro inicial para testes de consulta." }];
let medicamentos = [{ id: 1, nome: "Losartana", dosagem: "50mg", horario: "08:00", idosoId: 1 }];
let cuidados = [{ id: 1, descricao: "Verificar pressão arterial", data: "2026-06-01", responsavel: "Ana Paula", idosoId: 1 }];
let proximoUsuarioId = 2;
let proximoIdosoId = 2;
let proximoMedicamentoId = 2;
let proximoCuidadoId = 2;

function emailValido(email) { return typeof email === "string" && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email); }
function textoVazio(valor) { return valor === undefined || valor === null || String(valor).trim() === ""; }

app.get("/", (req, res) => res.json({ success: true, message: "API CUIDA+ em execução", endpoints: ["POST /api/usuarios", "GET /api/usuarios", "POST /api/login", "POST /api/idosos", "GET /api/idosos", "POST /api/medicamentos", "GET /api/medicamentos", "POST /api/cuidados", "GET /api/cuidados", "GET /api/relatorios/resumo"] }));

app.post("/api/usuarios", (req, res) => {
  const { nome, email, senha } = req.body;
  if (textoVazio(nome)) return res.status(400).json({ success: false, message: "Nome obrigatório" });
  if (!emailValido(email)) return res.status(400).json({ success: false, message: "E-mail inválido" });
  if (!senha || String(senha).length < 8) return res.status(400).json({ success: false, message: "Senha inválida" });
  const usuario = { id: proximoUsuarioId++, nome: String(nome).trim(), email: String(email).trim() };
  usuarios.push(usuario);
  return res.status(201).json({ success: true, message: "Usuário cadastrado com sucesso", data: usuario });
});

app.get("/api/usuarios", (req, res) => res.json({ success: true, data: usuarios }));

app.post("/api/login", (req, res) => {
  const { email, senha } = req.body;
  if (!emailValido(email)) return res.status(400).json({ success: false, message: "E-mail inválido" });
  if (!senha || String(senha).length < 8) return res.status(400).json({ success: false, message: "Senha inválida" });
  if (email === "familiar@email.com" && senha === "12345678") return res.status(200).json({ success: true, message: "Login realizado com sucesso", data: { nome: "Familiar Responsável", email } });
  return res.status(401).json({ success: false, message: "Credenciais inválidas" });
});

app.post("/api/idosos", (req, res) => {
  const { nome, idade, responsavelId, observacoes } = req.body;
  const idadeNumerica = Number(idade);
  if (textoVazio(nome)) return res.status(400).json({ success: false, message: "Nome obrigatório" });
  if (!Number.isFinite(idadeNumerica) || idadeNumerica < 60) return res.status(400).json({ success: false, message: "Idade mínima inválida" });
  const idoso = { id: proximoIdosoId++, nome: String(nome).trim(), idade: idadeNumerica, responsavelId: Number(responsavelId) || 1, observacoes: observacoes || "" };
  idosos.push(idoso);
  return res.status(201).json({ success: true, message: "Idoso cadastrado com sucesso", data: idoso });
});

app.get("/api/idosos", (req, res) => {
  const busca = req.query.nome ? String(req.query.nome).toLowerCase() : "";
  const resultado = busca ? idosos.filter((idoso) => idoso.nome.toLowerCase().includes(busca)) : idosos;
  return res.json({ success: true, message: resultado.length > 0 ? "Idosos encontrados" : "Nenhum idoso encontrado", data: resultado });
});

app.post("/api/medicamentos", (req, res) => {
  const { nome, dosagem, horario, idosoId } = req.body;
  if (textoVazio(nome)) return res.status(400).json({ success: false, message: "Nome do medicamento obrigatório" });
  if (textoVazio(dosagem)) return res.status(400).json({ success: false, message: "Dosagem obrigatória" });
  if (textoVazio(horario)) return res.status(400).json({ success: false, message: "Horário obrigatório" });
  const medicamento = { id: proximoMedicamentoId++, nome: String(nome).trim(), dosagem: String(dosagem).trim(), horario: String(horario).trim(), idosoId: Number(idosoId) || 1 };
  medicamentos.push(medicamento);
  return res.status(201).json({ success: true, message: "Medicamento cadastrado com sucesso", data: medicamento });
});

app.get("/api/medicamentos", (req, res) => res.json({ success: true, data: medicamentos }));

app.post("/api/cuidados", (req, res) => {
  const { descricao, data, responsavel, idosoId } = req.body;
  if (textoVazio(descricao)) return res.status(400).json({ success: false, message: "Descrição obrigatória" });
  if (textoVazio(data)) return res.status(400).json({ success: false, message: "Data obrigatória" });
  if (textoVazio(responsavel)) return res.status(400).json({ success: false, message: "Responsável obrigatório" });
  const cuidado = { id: proximoCuidadoId++, descricao: String(descricao).trim(), data: String(data).trim(), responsavel: String(responsavel).trim(), idosoId: Number(idosoId) || 1 };
  cuidados.push(cuidado);
  return res.status(201).json({ success: true, message: "Cuidado registrado com sucesso", data: cuidado });
});

app.get("/api/cuidados", (req, res) => res.json({ success: true, data: cuidados }));

app.get("/api/relatorios/resumo", (req, res) => res.json({ success: true, message: "Resumo gerado com sucesso", data: { totalUsuarios: usuarios.length, totalIdosos: idosos.length, totalMedicamentos: medicamentos.length, totalCuidados: cuidados.length } }));

app.listen(PORT, () => console.log(`API CUIDA+ rodando em http://localhost:${PORT}`));
