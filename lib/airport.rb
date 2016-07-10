require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "Plane already landed!" if plane.is_flying == false
    raise "Plane cannot land. Airport full." if full?
    raise "Abort landing. Stormy weather." if stormy?
    planes << plane
    plane.is_flying = false
    "Plane #{plane} has landed."
  end

  def take_off(plane)
    raise "Plane already flying!" if plane.is_flying
    raise "Plane not in that airport!" unless planes.include?(plane)
    raise "Abort take off. Stormy weather." if stormy?
    plane.is_flying = true
    planes.pop
    "Plane #{plane} has left the airport and is in the air."
  end

  private
  attr_reader :weather

  def full?
    planes.size >= capacity
  end

  def stormy?
    weather.stormy?
  end

end
