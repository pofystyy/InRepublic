require_relative '../spot'

module Inrepublic
  class Client
    module Spot
      def schedule
        spot_schedule(Inrepublic::Spot.schedule_path)
      end
    end
  end
end
