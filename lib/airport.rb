require_relative 'weather'
require_relative 'plane'

class Airport

def initialize(weather: Weather.new)
  @weather = weather
end
  attr_reader:plane

  def land(plane)
     fail "Stormy weather" if @weather.stormy?
     @plane = plane
  end

  def take_off(plane)
    fail "Plane can't take off due to stormy weather" if "weather.stormy?"
    @plane = nil
  end

end
