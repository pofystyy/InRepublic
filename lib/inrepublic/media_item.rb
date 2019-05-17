require_relative 'resources_api'

module InRepublic
  class MediaItem
    def initialize(item)
      @item = item
    end

    def create_media
      start_callback
      media_data = media
      stop_callback

      media_data
    end

    private

    def start_callback
      @start_callback = InRepublic::ResourcesApi.instance.start_callback(@item)
    end

    def media
      [@item, media_duration]
    end

    def stop_callback
      InRepublic::ResourcesApi.instance.stop_callback(@item)
    end

    def media_duration
      @start_callback['duration']
    end
  end
end
