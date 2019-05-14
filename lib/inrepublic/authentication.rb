require_relative 'request/resources_request'

module Inrepublic
  module Authentication
    def connect_to_location
      jwt_token(spot_signin(options))
    end

    def jwt_token(tokens)
      Inrepublic::Request::Resources.jwt_token(tokens['jwt_token'])
    end
  end
end
