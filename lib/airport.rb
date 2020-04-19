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
    "Plane has taken off"
  end

  def capacity(full = 1)
    @planes.count == full
  end
end
