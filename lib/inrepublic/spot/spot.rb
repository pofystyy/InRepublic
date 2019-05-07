module Inrepublic
  module Spot
    def schedule
      get('https://resources.aaa.webmil.com.ua/api/v1/spots/schedule', headers: {
            "Authorization": "Bearer #{jwt_token}"
          })
    end
  end
end
