require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = ["plane1"]
  end

  def land(plane)
    fail "Airport is full" if @planes.count == 1

    @planes << plane
  end

  def take_off
    "Plane has taken off"
  end
end
