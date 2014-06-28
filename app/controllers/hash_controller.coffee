scrypt = require('scrypt')

module.exports.create = (req, res) ->
  scrypt.hash.config.keyEncoding = 'buffer'
  scrypt.hash.config.outputEncoding = 'base64'
  data = new Buffer req.body.data
  scrypt.hash data, { N:1, r:1, p:1 }, (err, hash) ->
    return res.json(500, err) if err?
    res.json 200, { hash: hash }
