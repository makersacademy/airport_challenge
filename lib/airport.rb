require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Plane has already landed" unless plane.airborne?
    plane.instance_variable_set(:@airborne, false)
    @planes << plane
  end

  def take_off(plane)
    fail "Plane has already taken off" if plane.airborne?
    plane.instance_variable_set(:@airborne, true)
    @planes.delete(plane)
    @planes
  end

end
