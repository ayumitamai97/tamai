require "tamai/version"
require "uri"
require "net/http"
require "json"

class Tamai
  def self.station(postal)
    puts "数秒お待ちください"

    postal_str = postal.to_s
    return unless validate(postal_str)
    search(postal_str)

    if @station.nil?
      puts "見つかりませんでした"
      return
    end

    name = @station["name"]
    kana = @station["kana"]
    line = @station["line"]
    distance = @station["distance"].to_i.to_s
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
    postal_encoded = URI.encode postal
    json = Net::HTTP.get(URI.parse("http://geoapi.heartrails.com/api/json?method=getStations&postal=#{postal_encoded}"))
    station = JSON.parse(json)["response"]["station"]

    station.nil? ? return : @station = station[0]
  end

  def self.validate(postal)
    if correct?(postal)
      return true
    elsif correct_containing_hyphen?(postal)
      postal.gsub!("-", "")
      return true
    else
      puts "7桁の郵便番号を半角数字で入力してください"
      puts "（ハイフンの有無は問いません）"
      return false
    end
  end

  def self.correct?(postal)
    /^\d{7}$/.match(postal)
  end

  def self.correct_containing_hyphen?(postal)
    /^\d{3}-\d{4}$/.match(postal)
  end
end
