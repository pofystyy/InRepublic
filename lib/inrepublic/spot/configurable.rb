module Inrepublic
  module Spot
    module Configurable
      def self.keys
        [
          :auth_code
        ]
      end

      def options
        Hash[Inrepublic::Spot::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
      end
    end
  end
end
