require_relative 'lib/inrepublic'
require_relative 'lib/mqtt/mqtt'

spot = InRepublic::Client::Spot.new(id: 'id', location_id: 'location_id', state: 'state')


threads = []

threads << Thread.new do
  loop do
    spot.heart_beat
    sleep 30
  end
end

threads << Thread.new do
  loop do
    @new_media_got = Mqtt::Client.instance.request
  end
end

threads << Thread.new do
  loop do
    spot.update_campaigns if @new_media_got
    p 'next campaigns updated' if @new_media_got
    @new_media_got = false

    # p spot.ids
    # sleep 1.5

    @spot_media_item = spot.media_item

    def norm_id
      @spot_media_item.id != 'placeholder'
    end

    p @spot_media_item.id
    @spot_media_item.start_callback if norm_id

    (@spot_media_item.duration).downto(1) do |i|
      p "will last #{i} more seconds"
      sleep 0.2
    end

    @spot_media_item.stop_callback if norm_id
    p 'end'
  end
end

threads.each(&:join)
