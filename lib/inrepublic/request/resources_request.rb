require_relative '../response'
require 'httparty'

module Inrepublic
  module Request
    class Resources
      include HTTParty

      INREPUBLIC_RESOURCES_API_URI = 'https://resources.aaa.webmil.com.ua/api/v1'

      base_uri INREPUBLIC_RESOURCES_API_URI

      def self.jwt_token(jwt)
        @jwt_token = jwt
      end

      def self.options
        { headers: { "Authorization": "Bearer #{@jwt_token}" } }
      end

      def self.spot_schedule(path)
        request(:get, path, options)
      end

      private

      def self.request(http_method, path, options={})
        http_response = self.send(http_method, path, options)
        Inrepublic::Response.create(http_response)
      end
    end
  end
end
