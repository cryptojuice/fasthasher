environment = process.env.NODE_ENV || 'local'

defaults =
  environment: environment

config =
  prod:  JSON.parse(JSON.stringify(defaults))
  test:  JSON.parse(JSON.stringify(defaults))
  local: JSON.parse(JSON.stringify(defaults))

config.prod.port  = 8080
config.test.port  = 4000
config.local.port = 3000

module.exports = config[environment]
