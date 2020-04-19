require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if capacity
    @planes << plane
  end

  def take_off
    fail "No planes in airport" if @planes.count == 0
    @planes.pop
  end

  def capacity(full = 1)
    @planes.count == full
  end
end
