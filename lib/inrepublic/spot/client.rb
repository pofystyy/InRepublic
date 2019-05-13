require_relative '../request'
require_relative 'spot'
require_relative 'authentication'
require_relative 'configurable'

module Inrepublic
  module Spot
    class Client
      include Inrepublic::Request
      include Inrepublic::Spot
      include Inrepublic::Spot::Authentication
      include Inrepublic::Spot::Configurable

      def initialize(options={})
        Inrepublic::Spot::Configurable.keys.each do |key|
          value = options.key?(key) ? options[key] : Inrepublic::Spot.instance_variable_get(:"@#{key}")
          instance_variable_set(:"@#{key}", value)
        end
        connect_to_location
      end
    end
  end
end
