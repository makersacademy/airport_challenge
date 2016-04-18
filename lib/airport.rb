require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 50

  attr_reader :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def takeoff(plane)
    fail "Plane not in airport" unless planes.include? plane
    fail "Stormy weather" if stormy?
    plane.take_off
    planes.pop
    planes
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Stormy weather" if stormy?
     plane.land
     planes << plane
  end

  def stormy?
   weather.stormy?
  end

  private
  attr_reader :planes, :weather

  def full?
    planes.count >= capacity
  end

end