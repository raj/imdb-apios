require 'uri'
require 'net/http'
require "json"


module ImdbApios
  class Client
    def initialize
      ImdbApios::Constant::SIMPLE_GET_ENDPOINTS.each do |key, v|
        define_singleton_method :"#{key}" do |value|
          get_resource(v, value)
        end
      end
    end

    def get_title_plot_synopsis imdb_id
      return ""
    end

    def get_title_plot imdb_id
    end

    def get_title_user_reviews imdb_id
    end

    def get_title_metacritic_reviews imdb_id
    end

    def title_exists imdb_id
    end


    def search_for_name name
    end


    def search_for_title title
    end

    def get_popular_titles

    end

    def get_popular_shows

    end

    def get_popular_movies

    end

    def get_title_episodes imdb_id

    end

    private
    def get_resource(endpoint, imdb_id)
      get_credentials
      puts endpoint
      # puts imdb_id
      # headers = { 'Content-MD5' => "e59ff97941044f85df5297e1c302d260",
      #   'Content-Type' => "text/plain",
      #   'Date' => "Mon, 23 Jan 1984 03:29:56 GMT" }
      # @request = RestClient::Request.new(:url => "https://api.imdbws.com/title/tt1832382/releases",
      #   :headers => headers,
      #   :method => :get)
      # return endpoint
    end


    def get_credentials
      url = URI("https://api.imdbws.com/authentication/credentials/temporary/ios82?=")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/json'
      request.body = "{\"appKey\": \"#{ImdbApios::Constant::APP_KEY}\"}"

      response = http.request(request)
      return_response = JSON.parse(response.read_body)['resource']
      return return_response
    end


  end
end
