require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane, weather)
    fail "Stormy weather! It's too dangerous to land right now." if weather.stormy
    planes.push(plane)
    planes
  end

  def takeoff(plane, weather)
    fail "Stormy weather! It's too dangerous to takeoff right now." if weather.stormy
    planes.delete(plane)
    planes
  end

end
