require_relative 'plane'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?
    plane.landed
    planes << plane
  end

  private

  attr_reader :planes

  def full?
    planes.length >= capacity ? true : false
  end

end
