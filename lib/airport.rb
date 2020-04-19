require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full

    @planes << plane
  end

  def take_off
    "Plane has taken off"
  end

  def full(f = 1)
    @planes.count == f
  end
end
