const express = require('express');
const Joi = require('joi');
const mysql = require('mysql');

// Koristimo pool da bi automatski aquire-ovao i release-ovao konekcije
const pool = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'portfoliodb'
});

// Instanciramo ruter
const route = express.Router();

// Sema za validaciju
const sema = Joi.object().keys({
    naziv: Joi.string().trim().min(4).max(12).required(),
    tracer: Joi.string().trim().min(2).max(12).required(),
    opis: Joi.string().max(512).required()
});

// Middleware da parsira json request-ove
route.use(express.json());

// Prikaz svih poruka
route.get('/valute', (req, res) => {
    // Saljemo upit bazi
    pool.query('select * from valute', (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);  // Greska servera
        else
            res.send(rows);
    });
});

// Cuvanje nove poruke (vraca korisniku ceo red iz baze)
route.post('/valute', (req, res) => {
    // Validiramo podatke koje smo dobili od korisnika
    let { error } = Joi.validate(req.body, sema);  // Object decomposition - dohvatamo samo gresku

    // Ako su podaci neispravni prijavimo gresku
    if (error)
        res.status(400).send(error.details[0].message);  // Greska zahteva
    else {  // Ako nisu upisemo ih u bazu
        // Izgradimo SQL query string
        let query = "insert into valute (naziv, tracer, opis) values (?, ?, ?)";
        let formated = mysql.format(query, [req.body.naziv, req.body.tracer, req.body.opis]);

        // Izvrsimo query
        pool.query(formated, (err, response) => {
            if (err)
                res.status(500).send(err.sqlMessage);
            else {
                // Ako nema greske dohvatimo kreirani objekat iz baze i posaljemo ga korisniku
                query = 'select * from valute where id=?';
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
    let query = 'select * from valute where id=?';
    let formated = mysql.format(query, [req.params.id]);

    pool.query(formated, (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);
        else
            res.send(rows[0]);
    });
});

// Izmena poruke (vraca korisniku ceo red iz baze)
route.put('/valuta/:id', (req, res) => {
    let { error } = Joi.validate(req.body, sema);

    if (error)
        res.status(400).send(error.details[0].message);
    else {
        let query = "update valute set naziv=?, tracer=?, opis=? where id=?";
        let formated = mysql.format(query, [req.body.naziv, req.body.tracer, req.body.opis, req.params.id]);

        pool.query(formated, (err, response) => {
            if (err)
                res.status(500).send(err.sqlMessage);
            else {
                query = 'select * from valute where id=?';
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
route.delete('/valuta/:id', (req, res) => {
    let query = 'select * from valute where id=?';
    let formated = mysql.format(query, [req.params.id]);

    pool.query(formated, (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);
        else {
            let valuta = rows[0];

            let query = 'delete from valute where id=?';
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