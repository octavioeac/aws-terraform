const express = require("express");
const app = express();

const PORT = process.env.PORT || 3000;

// Health (liveness)
app.get("/health", (_req, res) => res.status(200).send("ok"));
// Readiness (opcional: para checks de ALB/K8s)
app.get("/ready", (_req, res) => res.status(200).json({ ready: true }));

// Ping simple
app.get("/", (_req, res) => res.send("Hola desde Node!"));

app.listen(PORT, () => {
  console.log(`Servidor listo en http://localhost:${PORT}`);
});
