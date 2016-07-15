###
Main application routes
###

module.exports = (app) ->
  setupProxyAPIs app
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
  #client use ajax to request per data from server side 
  app.get '/books', (req, res) ->
    res.json books

  app.get '/todos', (req, res) ->
    res.json todos

  app.get '/chartData', (req, res) ->
    res.json chartExampleData