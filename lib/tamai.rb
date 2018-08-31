require "tamai/version"
require "uri"
require "net/http"
require "json"
require "pry"

class Tamai
  def self.station(postal)
    search(postal)
    name = @station["name"]
    kana = @station["kana"]
    line = @station["line"]
    distance = @station["distance"]
    prev_station = @station["prev"]
    next_station = @station["next"]
    # prefecture = @station["prefecture"]
    # latitude = @station["y"]
    # longtitude = @station["x"]
    puts "最寄駅: " + line + " " + name + " （" + kana + "）駅"
    puts "隣駅: " + prev_station + "、" + next_station
    puts "ここから約" + distance + "m"
  end
  
  private
  def self.search(postal)
    postal_encoded = URI.encode postal.to_s
    json = Net::HTTP.get(URI.parse("http://geoapi.heartrails.com/api/json?method=getStations&postal=#{postal_encoded}"))
    JSON.parse(json)
    @station = JSON.parse(json)["response"]["station"][0]
  end
end
