const express = require('express');
const mongoose = require('mongoose');
const Note = require('./model/node.js');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


mongoose.connect('mongodb+srv://nipra245:nipra245@cluster0.zqwfq.mongodb.net/').then(function () {

    app.get("/", function (req, res) {
        res.send("Welcome to first backend  Home Page ")
    });
    app.get("/note/list", async function (req, res) {
        var notes = await Note.find();

        res.json({ notes });
    });
    app.get("/note/list/:userid", async function (req, res) {
        var notes = await Note.find({ userid: req.params.userid });

        res.json(notes);
    });


    app.post("/note/add", async function (req, res) {
        await Note.deleteOne({ id: req.body.id });
        const newNote = new Note({
            id: req.body.id,
            userid: req.body.userid,
            title: req.body.title,
            content: req.body.content
        })
        await newNote.save();
        const response = { nessage: "new data created!" }

        res.json(response);
    });

    app.post("/note/delete", async function (req, res) {


        await Note.deleteOne({ id: req.body.id });

        const response = { message: " data deleted!" + `id:${req.body.id}` };

        res.json(response);


    });

});


app.listen(4000);