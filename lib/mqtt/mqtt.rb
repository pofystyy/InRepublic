require_relative 'config'
require 'singleton'
require 'mqtt'

module Mqtt
  class Client
    include Singleton
    attr_reader :client
    def initialize
      @client = MQTT::Client.connect(connection_string)
    end

    def request
      client.subscribe(path_for[:topic])
      client.subscribe("#{path_for[:device_token]}+")

      return true if client.get
    end

    private

    def connection_string
      conf(:mqtt)[:mqtt][:connection_string]
    end

    def path_for
      conf(:service)[:path]
    end

    def conf(file_name)
      Mqtt::Config.new(file_name).config
    end
  end
end
