config  = require './config'
express = require 'express'

console.log "App is running in #{config.environment} environment, port #{config.port}"

app = express()

app.get '/', (req, res) ->
  res.send 200, 'hello'

app.listen(config.port)
