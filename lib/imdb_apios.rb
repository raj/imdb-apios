require "imdb_apios/version"
require "imdb_apios/constant"
require "imdb_apios/client"

module ImdbApios
  def self.validate_imdb_id imdb_id
    regex = /\A[a-zA-Z]{2}[0-9]{7}\z/
    !regex.match(imdb_id).nil? && imdb_id.length == 9
  end
end
