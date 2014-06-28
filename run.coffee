config     = require './config'
express    = require 'express'
bodyParser = require 'body-parser'
console.log "App is running in #{config.environment} environment, port #{config.port}"

app = express()
app.use bodyParser.json()
app.use bodyParser.urlencoded()

# Controllers
HashController = require('./app/controllers').HashController

app.post '/v1/hasher', HashController.create

app.listen(config.port)
