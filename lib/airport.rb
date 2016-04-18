require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr :weather, :capacity

  def initialize
    @planes = []
    @weather = Weather.new
    @capacity = 1
  end

  def land(plane)
    fail "Airport full" if full?
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

private
def full?
    @planes.count >= @capacity

  end


end