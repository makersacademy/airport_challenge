require_relative "weather_station"
class Airport

  def initialize (station = WeatherStation.new)
    @weather_station = station
  end

  def stormy?
    @weather_station.stormy?
  end
  
end
