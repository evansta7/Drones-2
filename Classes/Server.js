var loginValidation = require('./Login.js');

const express = require('express');
const app = express();
const port = process.env.port || 3000;
const path = require('path');
app.get('/page-login.html', (req, res) => {
    res.sendFile(path.join(__dirname, '../' ,"/page-login.html"));
});

app.listen(port, () => console.log('Listening on port: ' + port));