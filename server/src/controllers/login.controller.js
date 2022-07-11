const db = require('../db/pg');

const login = async (req, res) => {
    console.log(req.body);
    const { email, password } = req.body;

    const usuario = await db.query('SELECT C.correo,P.id_persona,P.nombre FROM Correo C, Usuario U, Persona P WHERE U.id_persona = P.id_persona AND P.id_persona = C.id_persona AND C.correo=$1::text AND U.contrasenia=MD5($2::text);', [email, password]);

    res.json(usuario.rows);
}

module.exports = {
    login
}