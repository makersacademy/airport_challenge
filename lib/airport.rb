require_relative "plane"

class Airport

  attr_reader :planes, :capacity, :stormy

  DEFAULT_CAPACITY = 10
  LIKELIHOOD_OF_STORMINESS = 0.2

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    rand(100) < (1 - LIKELIHOOD_OF_STORMINESS) * 100 ? @stormy = false : @stormy = true
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Cannot land at stormy airport" if @stormy
    @planes << plane
  end

  def takeoff(plane)
    @planes.reject! { |planes| planes == plane }
  end

  def full?
    @planes.length == capacity
  end
end
