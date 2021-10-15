# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'json'

module Sentim
  class Client
    API_URL = 'https://sentim-api.herokuapp.com/'

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter, stubs: nil)
      @adapter = adapter
      @stubs = stubs
    end

    def sentiment_validation
      SentimentValidation.new(self)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = API_URL
        conn.request :json, content_type: 'application/json', accept: 'application/json'
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter, @stubs
      end
    end
  end
end
