require_relative 'error'
require 'typhoeus'
require 'json'

module InRepublic
  module Request

    HTTP_OK_CODE      = 200
    HTTP_CREATED_CODE = 201

    def get(url, options = {}, skip_auth_headers: false)
      request(:get, url, options, skip_auth_headers)
    end

    def post(url, options = {}, skip_auth_headers: false)
      request(:post, url, options, skip_auth_headers)
    end

    private

    def request(method, path, options = {}, skip_auth_headers)
       request = Typhoeus::Request.new(
        path,
        method:  method,
        params:  options,
        headers: (headers_data unless skip_auth_headers)
      )
      request.run
      request_response = request.response

      request_response_code = request_response.code

      if request_response_code == HTTP_OK_CODE || request_response_code == HTTP_CREATED_CODE
        json_parse(request_response.body)
      else
        InRepublic::Error.from_response(request_response_code)
      end
    end

    def json_parse(request)
      JSON.parse(request)
    end

    def headers_data
      { "Authorization": "Bearer #{jwt_token}" }
    end
  end
end

