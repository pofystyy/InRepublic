require_relative 'authentication'
require_relative 'configurable'
require_relative 'request'
require_relative 'client/spot'

module Inrepublic
  class Client
    include Inrepublic::Authentication
    include Inrepublic::Configurable
    include Inrepublic::Request
    include Inrepublic::Client::Spot

    def initialize(options={})
      Inrepublic::Configurable.keys.each do |key|
        value = options.key?(key) ? options[key] : instance_variable_get(:"@#{key}")
        instance_variable_set(:"@#{key}", value)
      end
      connect_to_location
    end
  end
end
