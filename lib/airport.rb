require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []

  end

  def land(plane)
    raise "Plane cannot land. Airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
  end

private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
