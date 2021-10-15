# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'json'

module Sentim
  class Client
    API_URL = 'https://sentim-api.herokuapp.com/api/v1/'

    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = API_URL
        conn.request :json, content_type: 'application/json', accept: 'application/json'
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter
      end
    end

    def validate_text(text)
      connection.post { |r| r.body = { text: text }.to_json }
    end
  end
end
