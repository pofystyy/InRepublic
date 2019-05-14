require_relative 'error'
require 'json'

module Inrepublic
  module Response
    def self.create(http_response)
      http_response_code = http_response.code
      return parse(http_response.body) if http_response_code == 200
      Inrepublic::Error.from_response(http_response_code)
    end

    private

    def self.parse(http_response_body)
      JSON.parse(http_response_body)
    end
  end
end
