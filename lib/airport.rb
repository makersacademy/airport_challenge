require './lib/plane'

class Airport
  
  attr_reader :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "Weather is stormy. Landing not permitted." if weather == "stormy"
    @planes << plane unless plane.grounded
  end

  def takeoff(plane)
    raise "Weather is stormy. Takeoff not permitted." if weather == "stormy"
    planes.delete(plane)
  end

  def weather
    ["stormy", "sunny"].sample
  end

  private

  def full?
    return true if planes.length >= capacity
    false
  end
end
