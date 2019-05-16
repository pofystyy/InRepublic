require_relative 'request'
require 'singleton'

module InRepublic
  class AuthApi
    include Singleton
    include InRepublic::Request

    INREPUBLIC_AUTH_API_URL = 'https://auth.aaa.webmil.com.ua'.freeze

    def sign_in(auth_code)
      sign_in_path = '/spots/signin'
      post("#{INREPUBLIC_AUTH_API_URL}#{sign_in_path}", auth_code)
    end
  end
end
