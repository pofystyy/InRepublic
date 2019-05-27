require_relative 'request'
require 'singleton'

module InRepublic
  class ResourcesApi
    include Singleton
    include InRepublic::Request

    attr_reader :jwt_token

    INREPUBLIC_RESOURCES_API_URI = 'http://a9e83e35.ngrok.io/api/v1'.freeze

    def bearer=(jwt_token)
      @jwt_token = jwt_token
    end

    def campaigns
      campaigns_path = '/new_schedule'.freeze
      get("#{INREPUBLIC_RESOURCES_API_URI}#{campaigns_path}")
    end

    def start_callback(id)
      start_callback_path = "/campaigns/#{id}/impressions/start".freeze
      post("#{INREPUBLIC_RESOURCES_API_URI}#{start_callback_path}")
    end

    def stop_callback(id)
      stop_callback_path = "/campaigns/#{id}/impressions/stop".freeze
      post("#{INREPUBLIC_RESOURCES_API_URI}#{stop_callback_path}")
    end

    def heart_beat
      heart_beat_path = '/spots/heart_beat'.freeze
      post("#{INREPUBLIC_RESOURCES_API_URI}#{heart_beat_path}")
    end
  end
end
