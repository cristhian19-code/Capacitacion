const db = require("../db/pg")

const getTipoCargo = async (req, res) => {
    const tipos_cargo = await db.query("SELECT * FROM tipo_cargo;");

    res.json(tipos_cargo.rows);
}

const getConocimiento = async (req, res) => {
    const conocimientos = await db.query("SELECT * FROM conocimiento;");

    res.json(conocimientos.rows);
}

module.exports = {
    getTipoCargo,
    getConocimiento
}