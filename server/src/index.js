const express = require('express');
const app = express();
const cors = require('cors');

require('./db/pg');

// Middleware
const login = require('./routers/login');
const items = require('./routers/items');

app.set('port', 2000);

app.use(cors({
    origin: '*'
}));

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use('/api', login)
app.use('/items', items)

app.listen(app.get('port'), () => {
    console.log('server on port ', app.get('port'));
})