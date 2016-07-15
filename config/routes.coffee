###
Main application routes
###

module.exports = (app) ->
  setupProxyAPIs app
  return

setupProxyAPIs = (app) ->
  #日志/请求拦截入口
  app.use (req, res, next) ->
    console.log "refact middle ware:"
    console.log req.path
    console.log req.url
    console.log req.method
    next()
  
  #路由添加入口
  app.use "/api/test", require("./api/test")
  #app.use "/api/product", require("./api/product") #backend to provide product version per data
  #app.use "/api/statistics", require("./api/statistics") #backend to provide statistics per data
  #app.use "/api/score", require("./api/score") #backend to  provide score per data
