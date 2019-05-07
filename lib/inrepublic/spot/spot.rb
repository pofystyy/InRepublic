require_relative 'constants'

module Inrepublic
  module Spot
    include Inrepublic::Spot::Constants

    def schedule
      get(SPOT_SCHEDULE_URI, headers: {
            "Authorization": "Bearer #{jwt_token}"
          })
    end
  end
end
