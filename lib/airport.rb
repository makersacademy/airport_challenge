require 'weather'

class Airport
  include Weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = generate_weather
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
end
