expect  = require('chai').expect
request = require 'request'
scrypt  = require 'scrypt'

module.exports = ->
  @world = require('../support/world').World
  @testData = {}

  @Given /^the string of text "([^"]*)"$/, (text, callback) =>
    @testData.text = text
    callback()

  @When /^I make a post request to "([^"]*)"$/, (endpoint, callback) =>
    url = "http://localhost:4000#{endpoint}"
    request.post url, { form: { data: @testData.text } }, (err, res, body) =>
      @testData.hash = JSON.parse(res.body).hash
      expect(res.statusCode).to.eql(200)
      callback()

  @Then /^I should receive a base64 encoded hash of my text$/, (callback) =>
    hash = @testData.hash
    expect(hash.search(/^c2NyeXB0AAEAAAABAAAAA/)).to.eql(0)
    callback()
