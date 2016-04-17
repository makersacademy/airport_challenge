require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Too stormy to land" if stormy_weather?
    @planes << plane
    "Plane has landed"
  end

  def take_off(plane)
    fail "Too stormy to take off" if stormy_weather?
    @planes.delete(plane)
    "Plane has taken off"
  end

def stormy_weather?
  @weather.weather_setter
end

end