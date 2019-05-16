require_relative 'request'
require 'singleton'

module InRepublic
  class ResourcesApi
    include Singleton
    include InRepublic::Request

    attr_reader :jwt_token

    INREPUBLIC_RESOURCES_API_URI = 'https://resources.aaa.webmil.com.ua/api/v1/spots/schedule'.freeze

    def schedule
      get(INREPUBLIC_RESOURCES_API_URI, auth_headers: true)
    end

    def bearer=(jwt_token)
      @jwt_token = jwt_token
    end
  end
end
