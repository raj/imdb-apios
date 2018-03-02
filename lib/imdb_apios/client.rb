require 'uri'
require 'net/http'
require "json"
require 'api-auth'
require 'byebug'
require 'rest-client'


module ImdbApios
  class Client
    def initialize
      ImdbApios::Constant::SIMPLE_GET_ENDPOINTS.each do |key, v|
        define_singleton_method :"#{key}" do |value|
          res = get_resource(v, value)
          return res
        end
      end
    end

    private
    def get_resource(endpoint, imdb_id)
      creds = get_credentials
      params = {}
      path = endpoint.gsub('{imdb_id}',imdb_id.to_s)
      url = URI("https://api.imdbws.com#{path}")
      headers = ImdbApios::Signer.sign url, creds

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["content-type"] = 'application/json'
      request["accept-language"] = 'en_US'
      request["x-amz-date"] = headers['X-Amz-Date'] 
      request["x-amz-security-token"] = headers['X-Amz-Security-Token']
      request["x-amzn-authorization"] = headers['X-Amzn-Authorization']
      request["user-agent"] = 'IMDb/8.3.1 (iPhone9,4; iOS 11.2.1)'
      request.body = ""

      response = http.request(request)
      json_response = JSON.parse(response.read_body)['resource']
      return json_response

    end


    def get_credentials
      url = URI("https://api.imdbws.com/authentication/credentials/temporary/ios82?=")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/json'
      request.body = {"appKey": ImdbApios::Constant::APP_KEY }.to_json.to_s
      response = http.request(request)
      json_response = JSON.parse(response.read_body)['resource']
      return json_response
    end


  end
end
