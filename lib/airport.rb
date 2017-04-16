require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes


  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Weather not good for landing" if stormy?
    plane.arrival
    @planes << plane

  end

  def takeoff(plane)
    fail "Weather not good for taking off" if stormy?
    plane.depature
    @planes.pop
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..10) == 8
  end
end
