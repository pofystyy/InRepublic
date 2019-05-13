module Inrepublic
  module Configurable
    def self.keys
      [
        :auth_code
      ]
    end

    def options
      Hash[Inrepublic::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end
  end
end
