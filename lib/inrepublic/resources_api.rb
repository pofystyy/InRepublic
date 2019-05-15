require_relative 'request'

module Inrepublic
  module ResourcesApi
    include Inrepublic::Request

    INREPUBLIC_RESOURCES_API_URI = 'https://resources.aaa.webmil.com.ua/api/v1/spots/schedule'.freeze

    def schedule
      get(INREPUBLIC_RESOURCES_API_URI, auth_headers: true)
    end
  end
end
