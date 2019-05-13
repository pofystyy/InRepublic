require_relative 'inrepublic/client'

module Inrepublic
  def self.client(options)
    Inrepublic::Client.new(options)
  end
end
