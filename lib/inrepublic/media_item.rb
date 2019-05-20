require_relative 'resources_api'

module InRepublic
  class MediaItem
    def initialize(media_item)
      @media_item = media_item
    end

    def name
      metadata['filename']
    end

    def duration
      @media_item['duration']
    end

    def start_callback
      InRepublic::ResourcesApi.instance.start_callback(media_id)
    end

    def stop_callback
      InRepublic::ResourcesApi.instance.stop_callback(media_id)
    end

    private

    def media_id
      @media_item['id']
    end

    def file_data
      @media_item['file_data']
    end

    def original
      file_data['original']
    end

    def metadata
      original['metadata']
    end
  end
end
