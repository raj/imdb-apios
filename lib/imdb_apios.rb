require "imdb_apios/version"

module ImdbApios
  def self.validate_imdb_id imdb_id
    regex = /[a-zA-Z]{2}[0-9]{7}/
    !regex.match(imdb_id).nil?
  end
end
