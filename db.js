const mysql = require("mysql");
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "bloodlink_db"
});
db.connect((err) => {
  if (err) throw err;
  console.log("✅ Connecté à MySQL");
});
module.exports = db;
