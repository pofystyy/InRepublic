require_relative 'lib/inrepublic'

# Provide authentication credentials
p spot = InRepublic::Client::Spot.new(auth_code: 'AUTH_CODE')

# Fetch schedule for current spot
p spot.get_schedule
