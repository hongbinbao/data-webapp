###
product api
###
"use strict"

express = require("express")
router = express.Router()

router.get '/products', (req, res) ->
    res.json {}

router.get '/products/:pid', (req, res) ->
    res.json {}

router.post '/products/:pid', (req, res) ->
    res.json {}

module.exports = router