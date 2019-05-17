require_relative 'request'
require 'singleton'

module InRepublic
  class ResourcesApi
    include Singleton
    include InRepublic::Request

    attr_reader :jwt_token

    INREPUBLIC_RESOURCES_API_URI = 'https://resources.aaa.webmil.com.ua/api/v1'.freeze

    def bearer=(jwt_token)
      @jwt_token = jwt_token
    end

    def schedule
      schedule_path = '/spots/schedule'.freeze
      get("#{INREPUBLIC_RESOURCES_API_URI}#{schedule_path}")
    end

    def start_callback(id)
      start_callback_path = "/campaigns/#{id}/impressions/start".freeze
      post("#{INREPUBLIC_RESOURCES_API_URI}#{start_callback_path}")
    end

    def stop_callback(id)
      stop_callback_path = "/campaigns/#{id}/impressions/start".freeze
      post("#{INREPUBLIC_RESOURCES_API_URI}#{stop_callback_path}")
    end
  end
end
