const express = require("express");
const cors = require("cors");

const app = express();
const PORT = 8080;

app.use(cors());
app.use(express.json());

let usuarios = [];
let idosos = [];
let proximoUsuarioId = 1;
let proximoIdosoId = 1;

function emailValido(email) {
  return typeof email === "string" && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

app.get("/", (req, res) => {
  return res.json({
    success: true,
    message: "API CUIDA+ em execução",
    endpoints: ["POST /api/usuarios", "POST /api/idosos"]
  });
});

app.post("/api/usuarios", (req, res) => {
  const { nome, email, senha } = req.body;

  if (!nome || String(nome).trim() === "") {
    return res.status(400).json({
      success: false,
      message: "Nome obrigatório"
    });
  }

  if (!emailValido(email)) {
    return res.status(400).json({
      success: false,
      message: "E-mail inválido"
    });
  }

  if (!senha || String(senha).length < 8) {
    return res.status(400).json({
      success: false,
      message: "Senha inválida"
    });
  }

  const usuario = {
    id: proximoUsuarioId++,
    nome: String(nome).trim(),
    email: String(email).trim()
  };

  usuarios.push(usuario);

  return res.status(201).json({
    success: true,
    message: "Usuário cadastrado com sucesso",
    data: usuario
  });
});

app.post("/api/idosos", (req, res) => {
  const { nome, idade, responsavelId, observacoes } = req.body;
  const idadeNumerica = Number(idade);

  if (!nome || String(nome).trim() === "") {
    return res.status(400).json({
      success: false,
      message: "Nome obrigatório"
    });
  }

  if (!Number.isFinite(idadeNumerica) || idadeNumerica < 60) {
    return res.status(400).json({
      success: false,
      message: "Idade mínima inválida"
    });
  }

  const idoso = {
    id: proximoIdosoId++,
    nome: String(nome).trim(),
    idade: idadeNumerica,
    responsavelId: Number(responsavelId) || 1,
    observacoes: observacoes || ""
  };

  idosos.push(idoso);

  return res.status(201).json({
    success: true,
    message: "Idoso cadastrado com sucesso",
    data: idoso
  });
});

app.get("/api/usuarios", (req, res) => {
  return res.json({ success: true, data: usuarios });
});

app.get("/api/idosos", (req, res) => {
  return res.json({ success: true, data: idosos });
});

app.post("/api/login", (req, res) => {
  const { email, senha } = req.body;

  if (!emailValido(email)) {
    return res.status(400).json({
      success: false,
      message: "E-mail inválido"
    });
  }

  if (!senha || senha.length < 8) {
    return res.status(400).json({
      success: false,
      message: "Senha inválida"
    });
  }

  const usuario = usuarios.find(
    u => u.email === email
  );

  if (!usuario) {
    return res.status(401).json({
      success: false,
      message: "Usuário não encontrado"
    });
  }

  return res.json({
    success: true,
    message: "Login realizado com sucesso"
  });
});

app.listen(PORT, () => {
  console.log(`API CUIDA+ rodando em http://localhost:${PORT}`);
});
