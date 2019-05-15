require_relative 'request'

module Inrepublic
  module AuthApi
    include Inrepublic::Request

    INREPUBLIC_AUTH_API_URI = 'https://auth.aaa.webmil.com.ua/spots/signin'.freeze

    def sign_in(auth_code)
      post(INREPUBLIC_AUTH_API_URI, auth_code)
    end
  end
end
