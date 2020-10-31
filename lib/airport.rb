require_relative '../lib/plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(cap = 1)
    @planes = []
    @capacity = cap
  end

  def land(plane)
    raise 'Airport Full' if full?

    @planes << plane
  end

  def takeoff
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
