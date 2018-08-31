require "tamai/version"
require "uri"
require "net/http"
require "json"

class Tamai
  def self.search(postal)
    postal_encoded = URI.encode postal.to_s
    json = Net::HTTP.get(URI.parse("http://geoapi.heartrails.com/api/json?method=getStations&postal=#{postal}"))
    JSON.parse(json)
  end
end
