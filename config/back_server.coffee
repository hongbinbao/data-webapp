###
-----------------------------------
  Express Server setup
-----------------------------------
###
express = require 'express'


process.env.NODE_ENV = process.env.NODE_ENV or "development"

# Configuration
EXPRESS_PORT = 4000

# default livereload port is 35729
LIVERELOAD_PORT = 45553  

livereload = require('connect-livereload')

# TODO: Handle the movement of config files more gracefully
EXPRESS_ROOT = __dirname + '/../../agt-build'
console.log "->>>>>>>>>>>>>>>>> EXPRESS_ROOT path"
console.log EXPRESS_ROOT

module.exports =
  startExpress: ->
    console.log "Configuring Express"
    
    app = express()
    app.use livereload {port: LIVERELOAD_PORT }    #live debug port set
    app.use express.static EXPRESS_ROOT                #static file path serv-static by middle-ware
    app.listen EXPRESS_PORT

    setupProxyAPIs app

  startIoExpress: ->
    console.log "Configuring Io Express"

    app = express()
    server = require("http").createServer(app)
    socketio = require("socket.io").listen(server)
    server.listen EXPRESS_PORT, "localhost", ->
        console.log "Express server listening on %d, in %s mode", EXPRESS_PORT, app.get("env")
        return
    app.use livereload {port: LIVERELOAD_PORT } #live debug port set
    app.use express.static EXPRESS_ROOT #static file path serv-static by middle-ware
    setupProxyAPIs app

  startDemoExpress: ->
    console.log "Configuring Demo Express"

    app = express()
    server = require("http").createServer(app)
    socketio = require("socket.io").listen(server)
    require("./express") app     #express setup
    require("./routes") app       #route setup
    server.listen EXPRESS_PORT, "localhost", ->
        console.log "Express server listening on %d, in %s mode", EXPRESS_PORT, app.get("env")
        return

setupProxyAPIs = (app) ->

  # Import JSON objects from .json files
  books = require __dirname + '/../data/books'
  todos = require __dirname + '/../data/todos'
  chartExampleData = require __dirname + '/../data/chartExampleData'

  # Define URIs for the imported objects, and serve them
  # TODO: Doc: note that if you change the json stub data, you need to
  # restart the server at the moment
  app.use (req, res, next) ->
    console.log "middle ware:"
    console.log req.path
    console.log req.url
    console.log req.method
    next()

  app.get '/books', (req, res) ->
    res.json books

  app.get '/todos', (req, res) ->
    res.json todos

  app.get '/chartData', (req, res) ->
    res.json chartExampleData

