require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Cannot land as the airport is full' if full?
    weather_check
    plane.land(self)
    planes << plane
    self
  end

  def take_off(plane)
    fail 'Cannot take off: the plane is not in the airport' if !(planes.include?(plane))
    weather_check
    plane.take_off(self)
    planes.delete_at(planes.index(plane))

  end

  def full?
    planes.count >= capacity
  end

  def weather_check
    fail "Cannot complete command, the weather is too stormy" if Weather.stormy?
  end
  #private - just need to uncomment this and check tests

  def planes
    @planes
  end

end
