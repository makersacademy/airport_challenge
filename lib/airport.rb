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
    random_number = weather.random_number
    if @weather.weather_forecast(random_number) == 'stormy'
      raise 'take off prevented due to stormy weather'
    else
      print "#{@plane} departed"
    end
  end

end
