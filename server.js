const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const db = require("./db");

const app = express();
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, "public")));

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "landing.html"));
});

app.post("/register", (req, res) => {
  const { nom, email, groupe_sanguin, mot_de_passe, role } = req.body;
  db.query("INSERT INTO users (nom, email, groupe_sanguin, mot_de_passe, role) VALUES (?, ?, ?, ?, ?)",
    [nom, email, groupe_sanguin, mot_de_passe, role],
    err => err ? res.status(500).send("Erreur") : res.send("Inscription réussie")
  );
});

app.post("/login", (req, res) => {
  const { email, mot_de_passe } = req.body;
  db.query("SELECT * FROM users WHERE email = ? AND mot_de_passe = ?", [email, mot_de_passe], (err, rows) => {
    if (err) return res.json({ success: false });
    res.json({ success: rows.length > 0 });
  });
});

app.get("/profile/:email", (req, res) => {
  db.query("SELECT * FROM users WHERE email = ?", [req.params.email], (err, results) => {
    if (err || results.length === 0) return res.status(404).json({ error: "Introuvable" });
    res.json(results[0]);
  });
});

app.post("/request", (req, res) => {
  const { groupe_sanguin, localisation, nombre_poches, date_limite, telephone } = req.body;
  db.query("INSERT INTO requests (groupe_sanguin, localisation, nombre_poches, date_limite, telephone) VALUES (?, ?, ?, ?, ?)",
    [groupe_sanguin, localisation, nombre_poches, date_limite, telephone],
    err => err ? res.status(500).json({ message: "Erreur" }) : res.json({ message: "✅ Demande enregistrée" })
  );
});

setInterval(() => {
  db.query("DELETE FROM requests WHERE created_at < NOW() - INTERVAL 7 DAY", err => {
    if (!err) console.log("✅ Nettoyage des vieilles demandes");
  });
}, 60 * 60 * 1000);

app.get("/demandes", (req, res) => {
  const sql = req.query.group
    ? "SELECT * FROM requests WHERE groupe_sanguin LIKE ? ORDER BY created_at DESC"
    : "SELECT * FROM requests ORDER BY created_at DESC";
  const params = req.query.group ? [`%${req.query.group}%`] : [];
  db.query(sql, params, (err, rows) => {
    if (err) return res.status(500).json({ message: "Erreur" });
    res.json(rows);
  });
});
app.get('/api/user', (req, res) => {
  const email = req.query.email;
  if (!email) return res.status(400).json({ error: "Email requis" });

  db.query('SELECT * FROM users WHERE email = ?', [email], (err, result) => {
    if (err) return res.status(500).json({ error: "Erreur serveur" });
    if (result.length === 0) return res.status(404).json({ error: "Utilisateur non trouvé" });

    res.json(result[0]);
  });
});
app.get('/api/requests', (req, res) => {
  db.query('SELECT * FROM requests', (err, results) => {
    if (err) {
      console.error('Erreur lors de la récupération des demandes :', err);
      return res.status(500).json({ error: 'Erreur serveur' });
    }
    res.json(results);
  });
});


app.listen(3000, () => console.log("🚀 Serveur sur http://localhost:3000"));