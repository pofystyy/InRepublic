require_relative '../response'
require 'httparty'

module Inrepublic
  module Request
    class Auth
      include HTTParty

      INREPUBLIC_AUTH_API_URI = 'https://auth.aaa.webmil.com.ua'

      base_uri INREPUBLIC_AUTH_API_URI

      def self.spot_signin(auth_code)
        request(:post, '/spots/signin', { query: auth_code })
      end

      private

      def self.request(http_method, path, options)
        http_response = self.send(http_method, path, options)
        Inrepublic::Response.create(http_response)
      end
    end
  end
end
