require_relative 'media_item'
require 'time'

module InRepublic
  class Campaigns
    @@item = 0
    attr_reader :campaigns
    def initialize(campaigns_data)
      @campaigns = campaigns_data['campaigns']
    end

    # def ids
    #   campaigns.map { |i| i['id'] }
    # end

    def media_item
      media = one_item
      InRepublic::MediaItem.new(media)
    end

    private

    def one_item
      if @@item < campaigns.count
        media = campaigns[@@item]
        @@item += 1
      else
        @@item = 0
      end
      return one_item if media.nil?
      media
    end
  end
end
