require_relative 'request/auth_request'
require_relative 'request/resources_request'

module Inrepublic
  module Request
    def spot_signin(auth_code)
      Inrepublic::Request::Auth.spot_signin(auth_code)
    end

    def spot_schedule(path)
      Inrepublic::Request::Resources.spot_schedule(path)
    end
  end
end
