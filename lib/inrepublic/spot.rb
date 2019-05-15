require_relative 'auth_api'
require_relative 'request'
require_relative 'resources_api'

module Inrepublic
  class Spot
    include Inrepublic::AuthApi
    include Inrepublic::Request
    include Inrepublic::ResourcesApi

    attr_reader :jwt_token

    def initialize(options={})
      @auth_code = options.values.join
      tokens = connect_to_location

      @jwt_token = tokens['jwt_token']
    end

    def connect_to_location
      sign_in('auth_code' => @auth_code)
      # sign_in(auth_code: @auth_code)
    end

    def get_schedule
      schedule
    end
  end
end
