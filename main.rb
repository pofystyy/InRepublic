require_relative 'lib/inrepublic'

# Provide authentication credentials
spot = InRepublic::Client::Spot.new(auth_code: 'AUTH_CODE')

# Fetch schedule for current spot
p spot.work_now?
