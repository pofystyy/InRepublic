require_relative 'constants'
require 'json'

module Inrepublic
  module Spot
    module Authentication
      include Inrepublic::Spot::Constants

      def connect_to_location
        post(SPOT_SIGNIN_URI, query: options)
      end

      def location_tokens
        JSON.parse(connect_to_location.body)
      end
    end
  end
end
