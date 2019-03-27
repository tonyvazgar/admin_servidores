
const express = require('express');
var app = express();

/**
 * Returns the current date of the sever
 */
function getDateTime() {
    var date = new Date();
    return date.toJSON();
}

app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.get('/', function (req, res) {
    res.send(getDateTime());
});

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// // App
// const app = express();
// app.get('/', (req, res) => {
//   res.send('Hello world\n');
// });

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);