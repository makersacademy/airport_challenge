require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 30
  end

  def land(plane, weather)
    fail "Stormy weather! It's too dangerous to land right now." if weather.stormy
    fail "Can't land! This airport is full ..." if full?
    planes.push(plane)
    planes
  end

  def takeoff(plane, weather)
    fail "Stormy weather! It's too dangerous to takeoff right now." if weather.stormy
    planes.delete(plane)
    planes
  end

  def full?
    planes.count >= capacity
  end

end
