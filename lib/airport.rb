require_relative 'plane'
require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 20
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
  end

  def land(plane)
    raise 'Plane cannot land :Airport full' if planes.length >= capacity
    raise 'The landing is not allowed : stormy weather' if bad_weather
    planes << plane
  end

  def take_off(plane)
  end

  
end