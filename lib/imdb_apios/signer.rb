require 'base64'
require 'digest'

module ImdbApios
  class Signer
    def self.sign(url, creds)
      headers = get_auth_headers(url, creds)
      return headers

    end


    private
    def self.get_auth_headers url, creds
      headers = {}
      query = {}
      headers['X-Amz-Date'] = Time.now.gmtime.strftime("%a, %d %b %Y %H:%M:%S GMT")
      headers['X-Amz-Security-Token'] = creds['sessionToken']
      headers['Host'] = "api.imdbws.com"
      headers_to_sign = headers

      string_to_sign = <<-EOF
GET
#{url.path}

host:api.imdbws.com
x-amz-date:#{headers['X-Amz-Date']}
x-amz-security-token:#{creds['sessionToken']}

EOF

      secret_key = creds['secretAccessKey']
      access_key_id = creds['accessKeyId']

      hash = Digest::SHA256.digest string_to_sign.encode('utf-8')
      digest = OpenSSL::Digest.new("sha256")
      b64_hmac =  Base64.strict_encode64(OpenSSL::HMAC.digest(digest, secret_key, hash))
      authoriz = "AWS3 AWSAccessKeyId=" + access_key_id
      authoriz = authoriz + ",Algorithm=HmacSHA256,SignedHeaders=Host;X-Amz-Date;X-Amz-Security-Token,Signature=" + b64_hmac


      headers['X-Amzn-Authorization'] = authoriz
      headers['User-Agent'] = "IMDb/8.3.1 (iPhone9,4; iOS 11.2.1)"
      return headers

    end


  end
end
