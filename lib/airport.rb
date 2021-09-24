require 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_reader :planes
  attr_reader :weather

  def land(plane)
    raise "Airport is full" if @planes.count >= @capacity
    plane.flying = false
    @planes << plane
  end

  def take_off(plane)
    plane.flying = true
    @planes.delete(plane)
  end

  def generate_weather
    # If the random number > 7, then weather is stormy, otherwise it is sunny
    rand(10) > 7 ? "stormy" : "sunny"
  end
end
