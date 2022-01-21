require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []

  end

  def land(plane)
    raise "Plane cannot land. Airport is full." if full?
    raise "Plane cannot land. Weather is stormy." if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Plane cannot take off. Weather is stormy." if stormy?
  end

private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def stormy?
    rand(1..6) > 4
  end

end
