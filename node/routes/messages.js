const express = require('express');
const Joi = require('joi');
const mysql = require('mysql');

// Koristimo pool da bi automatski aquire-ovao i release-ovao konekcije
const pool = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'porukeDB'
});

// Instanciramo ruter
const route = express.Router();

// Sema za validaciju
const sema = Joi.object().keys({
    user: Joi.string().trim().min(4).max(12).required(),
    message: Joi.string().max(512).required()
});

// Middleware da parsira json request-ove
route.use(express.json());

// Prikaz svih poruka
route.get('/poruke', (req, res) => {
    // Saljemo upit bazi
    pool.query('select * from poruke', (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);  // Greska servera
        else
            res.send(rows);
    });
});

// Cuvanje nove poruke (vraca korisniku ceo red iz baze)
route.post('/poruke', (req, res) => {
    // Validiramo podatke koje smo dobili od korisnika
    let { error } = Joi.validate(req.body, sema);  // Object decomposition - dohvatamo samo gresku

    // Ako su podaci neispravni prijavimo gresku
    if (error)
        res.status(400).send(error.details[0].message);  // Greska zahteva
    else {  // Ako nisu upisemo ih u bazu
        // Izgradimo SQL query string
        let query = "insert into poruke (user, message) values (?, ?)";
        let formated = mysql.format(query, [req.body.user, req.body.message]);

        // Izvrsimo query
        pool.query(formated, (err, response) => {
            if (err)
                res.status(500).send(err.sqlMessage);
            else {
                // Ako nema greske dohvatimo kreirani objekat iz baze i posaljemo ga korisniku
                query = 'select * from poruke where id=?';
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
route.get('/poruka/:id', (req, res) => {
    let query = 'select * from poruke where id=?';
    let formated = mysql.format(query, [req.params.id]);

    pool.query(formated, (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);
        else
            res.send(rows[0]);
    });
});

// Izmena poruke (vraca korisniku ceo red iz baze)
route.put('/poruka/:id', (req, res) => {
    let { error } = Joi.validate(req.body, sema);

    if (error)
        res.status(400).send(error.details[0].message);
    else {
        let query = "update poruke set user=?, message=? where id=?";
        let formated = mysql.format(query, [req.body.user, req.body.message, req.params.id]);

        pool.query(formated, (err, response) => {
            if (err)
                res.status(500).send(err.sqlMessage);
            else {
                query = 'select * from poruke where id=?';
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
route.delete('/poruka/:id', (req, res) => {
    let query = 'select * from poruke where id=?';
    let formated = mysql.format(query, [req.params.id]);

    pool.query(formated, (err, rows) => {
        if (err)
            res.status(500).send(err.sqlMessage);
        else {
            let poruka = rows[0];

            let query = 'delete from poruke where id=?';
            let formated = mysql.format(query, [req.params.id]);

            pool.query(formated, (err, rows) => {
                if (err)
                    res.status(500).send(err.sqlMessage);
                else
                    res.send(poruka);
            });
        }
    });
});

module.exports = route;
