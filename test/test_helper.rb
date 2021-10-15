$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sentim'
require 'minitest/autorun'
require 'faraday'
require 'json'

class Minitest::Test
  def stub_response(fixture:, status: 200, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
    [status, headers, File.read("test/fixtures/#{fixture}.json")]
  end

  def stub_request(path = 'v1/', response:, method: :get, body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      arguments = [method, "/api/#{path}"]
      arguments << body.to_json if %i[post put patch].include?(method)
      stub.send(*arguments) { response }
    end
  end
end
