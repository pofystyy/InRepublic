require_relative 'lib/inrepublic'

spot = InRepublic::Client::Spot.new(auth_code: 'AUTH_CODE')

threads = []
threads << Thread.new do
  loop do
    spot.heart_beat
    sleep 30
  end
end

threads << Thread.new do
  loop do
    p spot.random_media_item.name
    spot.random_media_item.start_callback

    (spot.random_media_item.duration).downto(1) do |i|
      p "will last #{i} more seconds"
      sleep 1
    end

    spot.random_media_item.stop_callback
    p 'end'
  end
end

threads.each(&:join)
