require_relative 'plane'

class Airport
  attr_accessor :planes, :stormy
  CAPACITY = 30

  def initialize
    @planes = []
    @stormy = false
  end

  def land(plane)
    raise "Currently unsafe to land plane" if stormy?
    raise "Airport currently full" if full?
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
    stormy == true
  end

  def full?
    planes.size >= 30
  end

end
