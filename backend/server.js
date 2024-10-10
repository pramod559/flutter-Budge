//initialization
const express = require('express');
const app = express()

//App Routes
app.get("/", function (req, res) {
    res.send("this is the Home Page");
});

app.get("/notes", function (req, res) {
    res.send("this is the notes Page");
});


//Starting the server on a PORT
app.listen(5000, function () {
    console.log("{Server started at PORT: 5000}");
});
