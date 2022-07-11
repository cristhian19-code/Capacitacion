const { Pool } = require('pg');

const config = {
    host: 'localhost',
    user: 'postgres',
    password: 'root',
    database: 'capacitacion',
    port: 5433
}

const db = new Pool(config);

module.exports = db