Feature: As a user of the api, I should be able to hash a string of text

  Scenario: User hashes string of text
    Given the string of text "This is my text"
    When I make a post request to "/v1/hasher"
    Then I should receive a base64 encoded hash of my text
