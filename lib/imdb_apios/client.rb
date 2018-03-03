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

    def title_exists? imdb_id
      return false unless ImdbApios.validate_imdb_id(imdb_id)
      url = URI("http://www.imdb.com/title/#{imdb_id}/")
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Get.new(url)
      response = http.request(request)
      return  response.code == "200"
    end


    def search query
      clean_q = query.gsub(' ',"_").gsub(/[^0-9A-Za-z\-_\.~]/, '').downcase
      first_char = clean_q[0].downcase
      search_url = URI.encode(clean_q)
      url = URI("https://v2.sg.media-imdb.com/suggests/#{first_char}/#{search_url}.json")
      response = get url
      return response
    end

    def get_popular_titles
      get_resource "/chart/titlemeter"
    end
    
    def get_popular_shows
      get_resource "/chart/tvmeter"
    end
    



    private

    def get url
      creds = get_credentials
      params = {}
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
      
      unless response.code == "200"
        raise "StandardError"
      end
      re = /imdb\$.+\({1}(.+)\){1}/ # match suggest query which is not valid json
      if response.read_body.match(re)
        clean_resp = "{" + response.body.gsub(/imdb\$.+\({/,'').gsub(/}\)$/,"}")
        json_response = JSON.parse clean_resp
      else
        json_response = JSON.parse(response.read_body)
      end

      return json_response

    end


    def get_resource(endpoint, imdb_id="")
      path = endpoint.gsub('{imdb_id}',imdb_id)
      url = URI("https://api.imdbws.com#{path}")
      response = get url      
      return response["resource"]
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
