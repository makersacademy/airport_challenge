require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity, :planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "Plane already landed!" if plane.is_flying == false
    raise "Plane cannot land. Airport full." if full?
    raise "Abort landing. Stormy weather." if stormy?
    @planes << plane
    plane.is_flying = false
    "Plane #{plane} has landed."
  end

  def take_off(plane)
    raise "Abort take off. Stormy weather." if stormy?
    raise "Plane already flying!" if plane.is_flying
    plane.is_flying = true
    @planes.pop
    "Plane #{plane} is in the air."
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

end
