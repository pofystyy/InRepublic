require_relative 'lib/inrepublic'

# Provide authentication credentials
spot = InRepublic::Client::Spot.new(auth_code: 'AUTH_CODE')

# p spot.work_now?


loop do
  media_name, duration = spot.media_item
  p media_name
  (1..duration).step.reverse_each do |i|
    p "will last #{i} more seconds"
    sleep 0.1
  end
  p 'end'
end

