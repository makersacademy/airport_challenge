require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Plane has already landed!" unless plane.landed == false
    plane.landed = true
    @planes << plane
  end

  def take_off
    plane = @planes.shift
    plane.landed = false
    return plane
  end

end
