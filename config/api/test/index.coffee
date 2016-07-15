###
test api
###
"use strict"

express = require("express")
router = express.Router()

# Import JSON objects from .json files
books = require __dirname + '/../../../data/books'
todos = require __dirname + '/../../../data/todos'
chartExampleData = require __dirname + '/../../../data/chartExampleData'

router.get '/books', (req, res) ->
    res.json books

router.get '/todos', (req, res) ->
    res.json todos

router.get '/chartData', (req, res) ->
    res.json chartExampleData

module.exports = router