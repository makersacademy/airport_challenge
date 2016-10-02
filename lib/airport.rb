require_relative 'weather'
require_relative 'plane'

class Airport

def initialize(weather: Weather.new)
  @weather = weather
end
  attr_reader:plane

  @planes = []

  def land(plane)
     fail "Stormy weather" if @weather.stormy?
     @plane = plane
  end

  def take_off(plane)
    @plane = nil
  end

end
