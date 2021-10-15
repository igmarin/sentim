# frozen_string_literal: true

require 'test_helper'
require 'faraday'

class SentimentValidationTest < Minitest::Test
  def validate
    stub = stub_request('v1/', method: :post, body: body, response: stub_response(fixture: 'users/create', status: 201))
    client = Sentim::Client.new(adapter: :test, stubs: stub)
    sentiment = client.sentiment_validation
    response = sentiment.validate(text: 'Hello')

    assert_equal 0.0, response.result.polarity
    assert_equal 'Hello', response.sentences.first['sentence']
  end
end
