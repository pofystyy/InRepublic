require_relative 'request'

module InRepublic
  module ResourcesApi
    include InRepublic::Request

    INREPUBLIC_RESOURCES_API_URI = 'https://resources.aaa.webmil.com.ua/api/v1/spots/schedule'.freeze

    def schedule
      get(INREPUBLIC_RESOURCES_API_URI)
    end
  end
end
