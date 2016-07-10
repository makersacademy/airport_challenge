require_relative 'plane'

class Airport

  attr_reader :capacity, :planes #planes should be moved to a private method
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Cannot land as the airport is full' if full?
    plane.land
    planes << plane
    self
  end

  def full?
    planes.count >= capacity
  end

end
