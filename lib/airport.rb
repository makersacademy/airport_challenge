require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
  end

  def land(plane)
    planes.push(plane)
    planes
  end

  def takeoff(plane, weather)
    fail "Stormy weather! It's too dangerous to fly right now." if weather.stormy
    planes.delete(plane)
    planes
  end

end
