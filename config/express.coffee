###
Express configuration
###

express = require("express")
bodyParser = require("body-parser")
methodOverride = require("method-override")
cookieParser = require("cookie-parser")
errorHandler = require("errorhandler")
path = require("path")

livereload = require('connect-livereload')

LIVERELOAD_PORT = 45553  
EXPRESS_ROOT = __dirname + '/../../agt-build'
EXPRESS_ROOT2 = __dirname + '/../../agt-dist'


module.exports = (app) ->

  env = app.get("env")
  #app.set "views", config.root + "/server/views"
  #app.engine "html", require("ejs").renderFile
  #app.set "view engine", "html"
  #app.use compression()
  #app.use bodyParser.urlencoded(extended: false)
  #app.use bodyParser.json()
  #app.use methodOverride()
  #app.use cookieParser()

  if "production" is env                                             #production mode 
    console.log "production setup"
    app.use express.static EXPRESS_ROOT2
    app.use errorHandler()                                        #error handler

  if "development" is env or "test" is env                #debug mode
    console.log "development or test setup"
    app.use livereload {port: LIVERELOAD_PORT }
    app.use express.static EXPRESS_ROOT                #static file path serv-static by middle-ware
    app.use errorHandler()                                        #error handler

  return