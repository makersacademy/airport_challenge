require "plane"
require "weather_station"

class Airport

  attr_reader :capacity
  
  def initialize(default_capacity = 10, weather_station = WeatherStation.new)
    @capacity = default_capacity
    @planes = []
    @weather_station = weather_station
  end 

  def land_plane(plane)
    if @planes.length >= @capacity
      fail "No space available at the airport"
    end 

    @planes << plane
  end

  def launch_plane(plane)
    fail "Cannot launch the plane because it is not at this airport" unless @planes.include? plane
    fail "Cannot launch the plane, bad weather" unless @weather_station.check_weather == "Sunny"

    @planes.delete(plane)
    "Plane took off"
  end

end 
