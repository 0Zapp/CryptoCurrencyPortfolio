const express = require('express');
const msgs = require('./routes/messages');  // Nas ruter (REST API)

const app = express();

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

// Kazemo aplikaciji da za rute koje pocinju sa '/api' koristi nas ruter
app.use('/api', msgs);

app.get('/', (req, res) => {
    res.send('Zdravo!! :)');
});

app.listen(80);
