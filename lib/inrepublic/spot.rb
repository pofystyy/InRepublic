require_relative 'auth_api'
require_relative 'resources_api'

module InRepublic
  class Spot
    include InRepublic::AuthApi
    include InRepublic::ResourcesApi

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
