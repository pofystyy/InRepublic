module Inrepublic
  module Spot
    module Authentication
      def connect_to_location
        post('https://auth.aaa.webmil.com.ua/spots/signin', query: options)
      end

      def location_tokens
        eval connect_to_location.body
      end
    end
  end
end
