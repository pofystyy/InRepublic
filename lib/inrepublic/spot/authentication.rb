require 'json'

module Inrepublic
  module Spot
    module Authentication
      def connect_to_location
        JSON.parse spot_signin(options[options.keys.join.to_sym]).body
      end
    end
  end
end
