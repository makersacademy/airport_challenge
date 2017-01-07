require_relative "weather_station"
class Airport
  attr_reader :weather_station
  def initialize (station = WeatherStation.new)
    @weather_station = station
  end

  def stormy?
    @weather_station.stormy?
  end

end
