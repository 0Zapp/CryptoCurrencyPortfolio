const express = require('express');
const Joi = require('joi');
const mysql = require('mysql');
const jwt = require('express-jwt');
const jwks = require('jwks-rsa');

const authCheck = jwt({
    secret: jwks.expressJwtSecret({
      cache: true,
      rateLimit: true,
      jwksRequestsPerMinute: 5,
      jwksUri: "https://dev-ossvsd9s.eu.auth0.com/.well-known/jwks.json"
    }),
    // This is the identifier we set when we created the API
    audience: 'http://portfolio.com',
    issuer: "https://dev-ossvsd9s.eu.auth0.com/",
    algorithms: ['RS256']
  });

// Koristimo pool da bi automatski aquire-ovao i release-ovao konekcije
const pool = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'portfolio'
});

// Instanciramo ruter
const route = express.Router();

// Sema za validaciju
const sema = Joi.object().keys({
    name: Joi.string().trim().min(4).max(12).required(),
    description: Joi.string().max(512).required()
});

const transSema = Joi.object().keys({
    from: Joi.string().trim().min(4).max(100).required(),
    to: Joi.string().trim().min(4).max(100).required(),
    amount: Joi.required(),
    valutaId: Joi.required()
});

// Middleware da parsira json request-ove
route.use(express.json());

route.get('/valuta/:id/transactions', (req, res) => {
    query = 'select * from portfolio_transaction where currency_id=?';
    let formated = mysql.format(query, [req.params.id]);
     pool.query(formated, (err, rows) => {
         if (err)
             res.status(500).send(err.sqlMessage);  // Greska servera
         else
             res.send(rows);
     });
 });

// Prikaz svih poruka
route.get('/valute', (req, res) => {
    // Saljemo upit bazi
    pool.query('select * from portfolio_currency', (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);  // Greska servera
        else
            res.send(rows);
    });
});



// Cuvanje nove poruke (vraca korisniku ceo red iz baze)
route.post('/valute', authCheck, (req, res) => {
    // Validiramo podatke koje smo dobili od korisnika
    let { error } = Joi.validate(req.body, sema);  // Object decomposition - dohvatamo samo gresku

    // Ako su podaci neispravni prijavimo gresku
    if (error)
        res.status(400).send(error.details[0].message);  // Greska zahteva
    else {  // Ako nisu upisemo ih u bazu
        // Izgradimo SQL query string
        let query = "insert into portfolio_currency (name, description) values (?, ?)";
        let formated = mysql.format(query, [req.body.name, req.body.description]);

        // Izvrsimo query
        pool.query(formated, (err, response) => {
            if (err)
                res.status(500).send(err.sqlMessage);
            else {
                // Ako nema greske dohvatimo kreirani objekat iz baze i posaljemo ga korisniku
                query = 'select * from portfolio_currency where id=?';
                formated = mysql.format(query, [response.insertId]);

                pool.query(formated, (err, rows) => {
                    if (err)
                        res.status(500).send(err.sqlMessage);
                    else
                        res.send(rows[0]);
                });
            }
        });
    }
});

route.post('/valuta/:id',authCheck, (req, res) => {
    // Validiramo podatke koje smo dobili od korisnika
    let { error } = Joi.validate(req.body, transSema);  // Object decomposition - dohvatamo samo gresku
    
    // Ako su podaci neispravni prijavimo gresku
    if (error)
        res.status(400).send(error.details[0].message);  // Greska zahteva
    else {  // Ako nisu upisemo ih u bazu
        // Izgradimo SQL query string
        let query = "insert into portfolio_transaction (adressFrom, adressTo, amount, currency_id) values (?, ?, ?, ?)";
        let formated = mysql.format(query, [req.body.from, req.body.to, req.body.amount, req.body.valutaId]);

        // Izvrsimo query
        pool.query(formated, (err, response) => {
            if (err){
                res.status(500).send(err.sqlMessage);
                
            }else {
                // Ako nema greske dohvatimo kreirani objekat iz baze i posaljemo ga korisniku
                query = 'select * from portfolio_transaction where id=?';
                formated = mysql.format(query, [response.insertId]);

                pool.query(formated, (err, rows) => {
                    if (err)
                        res.status(500).send(err.sqlMessage);
                    else
                        res.send(rows[0]);
                });
            }
        });
    }
});

// Prikaz pojedinacne poruke
route.get('/valuta/:id', (req, res) => {
    let query = 'select * from portfolio_currency where id=?';
    let formated = mysql.format(query, [req.params.id]);

    pool.query(formated, (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);
        else
            res.send(rows[0]);
    });
});

// Izmena poruke (vraca korisniku ceo red iz baze)
route.put('/valuta/:id', authCheck, (req, res) => {
    let { error } = Joi.validate(req.body, sema);

    if (error)
        res.status(400).send(error.details[0].message);
    else {
        let query = "update portfolio_currency set name=?, description=? where id=?";
        let formated = mysql.format(query, [req.body.name, req.body.description, req.params.id]);

        pool.query(formated, (err, response) => {
            if (err)
                res.status(500).send(err.sqlMessage);
            else {
                query = 'select * from portfolio_currency where id=?';
                formated = mysql.format(query, [req.params.id]);

                pool.query(formated, (err, rows) => {
                    if (err)
                        res.status(500).send(err.sqlMessage);
                    else
                        res.send(rows[0]);
                });
            }
        });
    }

});

// Brisanje poruke (vraca korisniku ceo red iz baze)
route.delete('/valuta/:id', authCheck, (req, res) => {
    let query = 'select * from portfolio_currency where id=?';
    let formated = mysql.format(query, [req.params.id]);

    pool.query(formated, (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);
        else {
            let valuta = rows[0];

            let query = 'delete from portfolio_currency where id=?';
            let formated = mysql.format(query, [req.params.id]);

            pool.query(formated, (err, rows) => {
                if (err)
                    res.status(500).send(err.sqlMessage);
                else
                    res.send(valuta);
            });
        }
    });
});

module.exports = route;
