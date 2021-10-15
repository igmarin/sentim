module Sentim
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def default_headers
      {
        'Content-Type' => 'application/json',
        accept: 'application/json'
      }
    end

    def post_request(url, body:, headers: {})
      handle_response client.connection.post(url, body, default_headers.merge(headers))
    end

    def handle_response(response)
      message = response.body['error']
      case response.status
      when 400
        raise Error, message
      when 401
        raise Error, message
      when 405
        raise Error, message
      when 500
        raise Error, message
      end
      response
    end
  end
end
