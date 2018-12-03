require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :plane, :weather

  def initialize(plane = Plane.new, weather = Weather.new)
    @plane = plane
    @weather = weather
  end

  def land(plane)
    @plane = plane
  end

  def release_plane
    message = "departure prevented due to stormy weather"
    fail message if @weather.weather_forecast == false
    print "#{@plane} departed"
  end

end
