require_relative 'plane'

class Airport
  attr_accessor :planes, :stormy
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = false
    @capacity = capacity
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
    planes.size >= @capacity
  end

end
