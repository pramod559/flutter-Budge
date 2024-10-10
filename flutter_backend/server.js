const express = require('express');
const app = express();

app.get("/", function (req, res) {
    res.send("Welcome to first backend  Home Page ")
});

app.get("/login", function (req, res) {
    res.send("Welcome to login Page ")
});

app.get("/logout", function (req, res) {
    res.send("Welcome to logout Page ")
});

app.get("/home", function (req, res) {
    res.send("Welcome to   Home Page ")
});





app.listen(4000);