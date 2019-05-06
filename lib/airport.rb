require_relative './plane.rb'
class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = rand(11)
  end

  def full?
    @planes.length > @capacity
  end

  def stormy?
    @weather > 8
  end

  def land(plane)
    raise 'airport too full to land' if full?
    raise 'too stormy to land' if stormy?

    @planes << plane
    return "Plane landed"
  end

  def take_off(plane)
    raise 'too stormy to take off' if stormy?

    @planes.delete(plane)
    return "Plane took off"
  end
end
