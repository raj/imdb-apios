require 'uri'
require 'net/http'
require "json"
require 'api-auth'
require 'byebug'

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
      creds = get_credentials
      # puts imdb_id
      # headers = { 'Content-MD5' => "e59ff97941044f85df5297e1c302d260",
      #   'Content-Type' => "text/plain",
      #   'Date' => "Mon, 23 Jan 1984 03:29:56 GMT" }
      # @request = RestClient::Request.new(:url => "https://api.imdbws.com/title/tt1832382/releases",
      #   :headers => headers,
      #   :method => :get)
      # return endpoint

      # Aws.config[:credentials] = Aws::Credentials.new("ASIAJUDYQJMLFXDTUVQQ", "iwlB5B1U17O88gVNaEPxZdi+LaHdxi3c/rL6e/pf")
      # puts Aws.config

      # signer = Aws::Sigv4::Signer.new(
      #     service: 's3',
      #     region: 'us-east-1',
      #     access_key_id: 'ASIAJUDYQJMLFXDTUVQQ',
      #     secret_access_key: 'iwlB5B1U17O88gVNaEPxZdi+LaHdxi3c/rL6e/pf'
      #   )
      # url = signer.presign_url(
      #   http_method: 'GET',
      #   url: 'https://api.imdbws.com/title/tt1832382/releases',
      #   expires_in: 3600 # one hour
      # )


      # @request = RestClient.get 'https://api.imdbws.com/title/tt1832382/releases'
      # (url: "https://api.imdbws.com/title/tt1832382/releases",headers: {},method: :get)
      # @request.get
      # puts @request
      url = 'https://api.imdbws.com/title/tt0111161/plot'
      uri = URI.parse(url)
      path = uri.path
      puts "\nurl=", url
      puts "\npath=", path
      headers = ImdbApios::Signer.sign url, creds
      puts "\nheaders=", headers
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      
      req = Net::HTTP::Get.new(uri)
      req.add_field('Accept-Language', 'en_US')
      req.add_field('X-Amz-Date', headers['X-Amz-Date'])
      req.add_field('X-Amz-Security-Token', headers['X-Amz-Security-Token'])
      req.add_field('X-Amzn-Authorization', headers['X-Amzn-Authorization'])
      req.add_field('User-Agent', headers["User-Agent"])
      
       

      res = http.request req
      byebug
      puts res
      # @signed_request = ApiAuth.sign!(req, "ASIAJ4AR2BRNZJ2EPYIQ", "2IYkV33+dNbX18geZ4D5Sz4cjdnpKr9N9cA2mFei")
      # puts @signed_request['Authorization']
      # puts @signed_request['Content-MD5']
      # response = @signed_request.exec
    	# puts "Response " + response.inspect
      # response = http.request @signed_request
      # puts response
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
      # puts json_response
      return json_response
    end


  end
end
