require "tamai/version"
require "uri"
require "net/http"
require "json"
require "pry"

class Tamai
  def self.station(postal)
    search(postal)
    puts @station
    # @name = @station["name"]
    # @kana = @station["kana"]
    # @line = @station["line"]
    # @latitude = @station["y"]
    # @longtitude = @station["x"]
    # @distance = @station["distance"]
    # @prefecture = @station["prefecture"]
    # @prev_@station = @station["prev"]
    # @next_@station = @station["next"]
  end
  
  private
  def self.search(postal)
    postal_encoded = URI.encode postal.to_s
    json = Net::HTTP.get(URI.parse("http://geoapi.heartrails.com/api/json?method=getStations&postal=#{postal_encoded}"))
    JSON.parse(json)
    @station = JSON.parse(json)["response"]["station"][0]
  end
end
