require_relative 'plane'

class Airport
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    self.full? ? (fail "Cannot land. The airport is full.") : planes << plane
  end

  def take_off(plane)
    return planes.delete(plane)
  end

  def full?
    planes.length >= capacity
  end
end