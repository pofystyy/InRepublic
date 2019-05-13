require 'httparty'
require 'json'

module Inrepublic
  module Request
    class Auth
      include HTTParty
      INREPUBLIC_AUTH_API_URI = 'https://auth.aaa.webmil.com.ua'

      base_uri INREPUBLIC_AUTH_API_URI

      def self.spot_signin(auth_code)
        @spot_signin_data = request(:post, '/spots/signin', { query: { auth_code: auth_code } })
      end

      def self.jwt_token
        JSON.parse(@spot_signin_data.body)['jwt_token']
      end

      private

      def self.request(http_method, path, options)
        self.send(http_method, path, options)
      end
    end
  end
end
