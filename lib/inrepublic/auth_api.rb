require_relative 'request'

module InRepublic
  module AuthApi
    include InRepublic::Request

    INREPUBLIC_AUTH_API_URI = 'https://auth.aaa.webmil.com.ua/spots/signin'.freeze

    def sign_in(auth_code)
      post(INREPUBLIC_AUTH_API_URI, auth_code, skip_auth_headers: true)
    end
  end
end
