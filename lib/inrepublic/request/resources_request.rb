require_relative 'auth_request'
require 'httparty'

module Inrepublic
  module Request
    class Resources
      include HTTParty

      INREPUBLIC_RESOURCES_API_URI = 'https://resources.aaa.webmil.com.ua/api/v1'

      base_uri INREPUBLIC_RESOURCES_API_URI

      def self.headers_data
        { headers: { "Authorization": "Bearer #{Inrepublic::Request::Auth.jwt_token}" } }
      end

      def self.spot_schedule(path)
        request(:get, path, headers_data)
      end

      private

      def self.request(http_method, path, options)
        self.send(http_method, path, options)
      end
    end
  end
end
