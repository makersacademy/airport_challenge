require 'plane'

class Airport

attr_reader :planes
attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @plane = plane
    @plane.landed = true
  end

  def take_off(plane)
    @plane = plane
    @plane.landed = false
  end
