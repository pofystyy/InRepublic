require_relative 'inrepublic/spot/client'

module Inrepublic
  module Spot
    def self.client(options)
      Inrepublic::Spot::Client.new(options)
    end
  end
end
