require_relative 'inrepublic/spot'

module InRepublic
  module Client
    module Spot
      def self.new(options)
        InRepublic::Spot.new(options)
      end
    end
  end
end
