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
    random_number = @weather.random_number
    message = "departure prevented due to stormy weather"
    fail message if @weather.weather_forecast(random_number) == 'stormy'
    @plane
      # print "#{@plane} departed"
  end

end
