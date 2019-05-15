require_relative 'lib/inrepublic'

# Provide authentication credentials
p spot = Inrepublic::Client::Spot.new(auth_code: 'AUTH_CODE')

# Fetch schedule for current spot
p spot.get_schedule
