require 'httparty'
require 'digest'

module ImdbApios
  class Signer
    def self.sign(url, creds)
      puts "CREDS = ", creds, "_____________________"
      # puts 
      headers = get_auth_headers(url, creds)
      # puts "HEADERS = ", headers, "_____________________"
      return headers
      
    end


    private
    def self.get_auth_headers url, creds
      headers = {}
      query = {}
     
      # headers['Accept-Language'] = "en_US"
      headers['X-Amz-Date'] = Time.now.strftime("%a, %d %b %Y %H:%M:%S GMT")
      headers['X-Amz-Security-Token'] = creds['sessionToken']

      
      headers_to_sign = headers_to_sign(headers)
      string_to_sign = string_to_sign(headers_to_sign, url)
      # res = HTTParty.get(url, query: query, headers: headers)

      # digest = OpenSSL::Digest.new(digest)
      # hash_value = Digest::SHA256.digest string_to_sign.encode('utf-8')

      # string_to_sign =
      #   ['GET',
      #   '/title/tt0111161/plot',
      #   '',
      #   'host:api.imdbws.com',
      #   'x-amz-date:Fri, 02 Mar 2018 13:48:04 GMT',
      #   'x-amz-security-token:AgoGb3JpZ2luECIaCXVzLWVhc3QtMSKAAiIgUJJZ3u2WW5ThYB6A/cY60goqJQ6BFbzcOLn09VPy8c6+Ms2OQr+vqSrTICxQt+Lz7JilQjgmxBP24gb/TwifDFy0hDFBOS70OCn/TDJZ+jxwqeH1bU74MJGDnb3TbCOw5ZlOFA9JFP+s4T5QfB7sy51cIqn2NKHbyeDibNxC49QxGy9J5OuKqPIgLhT/ZqTJfVx7fyrqM5ztL60IqBlixGZGEmq+k4+FmhepideTbvwdLFlaeFYMf+pGSW6uEhbo2ZGkml6sWhSPYrIjVpIXWk4qp6w3heCdydDIrWFuKGZMK6qzUN4H+x+uZsL8Dut/5FGLSQ5XzU7tvt7xbvUqkAIIFxAAGgw1ODA1NjYwODgzMTciDNDuKpb5QMTGpfbZYirtAQPLqeeN7P4AhkN9wrBaN49Hcrm1/4DAIgm/gip1J0HIMvdLchkIU93CBU33tYadGUYTYaHt9EPNBtNITT/t4sXpxpvjDtYRTK5rbUJq+y7kgmflftMoNDIr/QQpbULslOYOEyvVoaA58InkgX5czqPU2Ch0Opi2gt1ZKP3vHXDWZU6KvSfllJ+3M+xBeXwgsL0OZenD1AaoWGupIIDdpVbvuPQASPxd1kCmNGgXo73rkNJ6zKlQG3zkcnhnaXLdfjLSs/6qvWxlv/WIWy4wiwc2RQ5QiNs9qto/3p1vG2EO16Dow/MgffjbG8ofpjCVrOXUBQ==',
      #   '',
      #   ''].join("\n")
      
# hash        
# b'%\xee\xff\xdd\x01Z\xf4\x9b\xc9\x93\xe4\x8f~E\xf6]\xf6\x8a=\xc3,\xcb\x18"\xb2\x00oO\xe0\x9e\xc76'
# b64_hmac
# F2ace1C/ztTZYnqaTH2HcFiCthbMeZ9TUPwh3LjNlVc=

      secret_key = creds['secretAccessKey']
      # secret_key = "F7o1MCJ/DXARAV33qfFwNsLtYZNRgAtK78GXztfz"


      puts string_to_sign

      hash = Digest::SHA256.digest string_to_sign.encode('utf-8')
      hash = hash
      # b64_hmac= Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), '76a6cc20-6073-4290-8a2c-951b4580ae4a', hash)).strip()

      digest = OpenSSL::Digest.new("sha256")
      b64_hmac =  Base64.strict_encode64(OpenSSL::HMAC.digest(digest, secret_key, hash))
      authoriz = "AWS3 AWSAccessKeyId=" + creds['accessKeyId']
      authoriz = authoriz + ",Algorithm=HmacSHA256,SignedHeaders=Host;X-Amz-Date;X-Amz-Security-Token,Signature=" + b64_hmac
      headers['X-Amzn-Authorization'] = authoriz
      headers['User-Agent'] = "IMDb/8.3.1 (iPhone9,4; iOS 11.2.1)"

      # new_hmac = self._get_hmac()
      # new_hmac.update(string_to_sign)
      # return encodebytes(new_hmac.digest()).decode('utf-8').strip()

      # digest = OpenSSL::Digest.new('sha256')
      # encodebytes(new_hmac.digest()).decode('utf-8').strip()
      # OpenSSL::HMAC.digest(digest, key, message)
      

      # hash_value = sha256(string_to_sign.encode('utf-8')).digest()
      #   b64_hmac = self.sign_string(hash_value)
      #   s = "AWS3 AWSAccessKeyId=%s," % self._provider.access_key
      #   s += "Algorithm=%s," % self.algorithm()
      #   s += "SignedHeaders=%s," % ';'.join(headers_to_sign)
      #   s += "Signature=%s" % b64_hmac
      #   req.headers['X-Amzn-Authorization'] = s

      return headers
      # byebug
    end

    def self.string_to_sign headers, url
      canonical_qs = ""
      canonical_headers = ""
      uri = URI.parse(url)
      path = uri.path
      body = ""
      canonical_headers = ["host:api.imdbws.com","x-amz-date: #{headers['X-Amz-Date']}","x-amz-security-token: #{headers['X-Amz-Security-Token']}"].join("\n")
      string_to_sign = ["GET", path, canonical_headers,"", body].join("\n")
      return string_to_sign
     end

    def self.headers_to_sign headers
      heads = {'Host': 'api.imdbws.com'}.merge headers
      return heads
    end
 
  end
end