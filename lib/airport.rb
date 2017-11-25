require_relative 'plane'

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.landing
    planes << plane
  end

  def takeoff(plane)
    plane.taking_off
    planes.delete(plane)
  end

end
