require_relative 'inrepublic/spot'

module Inrepublic
  module Client
    module Spot
      def self.new(options)
        Inrepublic::Spot.new(options)
      end
    end
  end
end
