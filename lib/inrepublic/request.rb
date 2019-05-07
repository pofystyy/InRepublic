require 'httparty'

module Inrepublic
  module Request
    def get(url, options = {})
      request(:get, url, options)
    end

    def post(url, options = {})
      request(:post, url, options)
    end

    def put(url, options = {})
      request(:put, url, options)
    end

    def delete(url, options = {})
      request(:delete, url, options)
    end

    private

    def request(method, path, options = {})
      HTTParty.send(method, path, options)
    end
  end
end
