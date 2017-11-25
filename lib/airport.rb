require_relative 'plane'

class Airport
  attr_accessor :planes, :stormy

  def initialize
    @planes = []
    @stormy = false
  end

  def land(plane)
    raise "Currently unsafe to land plane" if stormy == true
    plane.landing
    planes << plane
  end

  def takeoff(plane)
    raise "Currently unsafe for plane to take off" if stormy == true
    plane.taking_off
    planes.delete(plane)
  end

end
