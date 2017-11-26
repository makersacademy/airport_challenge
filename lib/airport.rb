require_relative 'plane'

class Airport
  attr_accessor :planes, :stormy
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @stormy = set_weather
    @capacity = capacity
  end

  def land(plane)
    raise "Currently unsafe to land plane" if stormy?
    raise "Airport currently full" if full?
    raise "This plane is already landed" if plane.flying == false
    plane.landing
    planes << plane
  end

  def takeoff(plane)
    raise "Currently unsafe for plane to take off" if stormy?
    raise "Plane is already in the air" if plane.flying == true
    plane.taking_off
    planes.delete(plane)
  end

  def set_weather
    rand(100) > 92 ? true : false
  end

  private
  def stormy?
    stormy == true
  end

  def full?
    planes.size >= @capacity
  end
end
