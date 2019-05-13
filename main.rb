require_relative 'lib/inrepublic'

# Provide authentication credentials
client = Inrepublic.client(auth_code: 'AUTH_CODE')

# Fetch schedule for current spot
p client.schedule
