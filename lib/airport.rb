require_relative '../lib/plane'
require_relative '../lib/weather'

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

    plane.landed
    @planes << plane
  end

  def takeoff(plane)
    raise 'Too Stormy to take off' if stormy?

    plane = @planes.pop
    plane.flying
    print "#{plane} is now in the air"
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(1..4) == 1
  end
end
