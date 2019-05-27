require_relative 'resources_api'

module InRepublic
  class MediaItem
    attr_reader :media_item
    def initialize(media_item)
      @media_item = media_item
    end

    def id
      media_item['id']
    end

    def duration
      media_item['duration']
    end

    def start_callback
      InRepublic::ResourcesApi.instance.start_callback(id)
    end

    def stop_callback
      InRepublic::ResourcesApi.instance.stop_callback(id)
    end
  end
end
