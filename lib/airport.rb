require "plane"
require "weather_station"

class Airport

  attr_reader :capacity, :planes
  
  def initialize(default_capacity = 10, weather_station = WeatherStation.new)
    @capacity = default_capacity
    @planes = []
    @weather_station = weather_station
  end 

  def land_plane(plane)
    fail "No space available at the airport" if @planes.length >= @capacity
    fail "Cannot land the plane, bad weather" if @weather_station.check_weather == "Stormy"

    plane.land
    @planes << plane
  end

  def launch_plane(plane)
    fail "Cannot launch the plane because it is not at this airport" unless @planes.include? plane
    fail "Cannot launch the plane, bad weather" if @weather_station.check_weather == "Stormy"

    plane.take_off
    @planes.delete(plane)
  end

end 
