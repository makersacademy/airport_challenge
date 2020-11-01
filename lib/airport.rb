require_relative '../lib/plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(cap = 1)
    @planes = []
    @capacity = cap
  end

  def land(plane)
    raise 'Already landed' if plane.already_landed?
    raise 'Airport Full' if full?
    raise 'Too Stormy to land' if stormy?

    plane.landed = true
    @planes << plane
  end

  def takeoff(plane)
    raise 'Too Stormy to take off' if stormy?

    plane.landed = false
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..4) == 1
  end
end
