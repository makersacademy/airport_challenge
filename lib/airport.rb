require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100

  attr_reader :capacity
  attr_reader :planes
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  # come back and sort this out
#  def stormy
#    @stormy = true
#  end

  def land(plane)
    raise "Plane cannot land. Airport full." if full?
    raise "Abort landing. Stormy weather." if stormy?
    @planes << plane
    "Plane #{plane} has landed."
  end

  def take_off(plane)
    raise "Abort take off. Stormy weather." if stormy?
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
