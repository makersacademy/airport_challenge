require_relative 'plane'

class Airport
  attr_accessor :planes, :stormy

  def initialize
    @planes = []
    @stormy = false
  end

  def land(plane)
    raise "Currently unsafe to land plane" if stormy?
    plane.landing
    planes << plane
  end

  def takeoff(plane)
    raise "Currently unsafe for plane to take off" if stormy?
    plane.taking_off
    planes.delete(plane)
  end

  private
  def stormy?
    stormy == true ? true : false
  end

end
