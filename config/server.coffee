###
-----------------------------------
  Express Server entry point
-----------------------------------
###
express = require 'express'

EXPRESS_PORT = 4000

process.env.NODE_ENV = process.env.NODE_ENV or "development"

module.exports =
  startDemoExpress: ->
    console.log "Configuring Demo Express"

    app = express()
    server = require("http").createServer(app)
    socketio = require("socket.io").listen(server)
    require("./express") app     #express setup
    require("./routes") app       #route setup
    #listen on openshift ip. need to change in deploy mode
    server.listen EXPRESS_PORT, process.env.OPENSHIFT_NODEJS_IP, ->
        console.log "Demo Express server listening on %d, in %s mode", EXPRESS_PORT, app.get("env")
        return


