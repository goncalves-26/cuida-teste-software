const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => {
  res.redirect("/cadastro");
});

app.get("/cadastro", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "cadastro.html"));
});

app.get("/idosos/novo", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "cadastro-idoso.html"));
});

app.listen(PORT, () => {
  console.log(`Frontend CUIDA+ rodando em http://localhost:${PORT}`);
});
