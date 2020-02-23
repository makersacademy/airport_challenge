require_relative "plane"

class Airport

  attr_reader :plane
  attr_accessor :capacity

  def initialize(capacity = 20)
    @plane = []
    @capacity = capacity 
  end

  def land_plane(plane)
    fail "We have too many planes captain!" if plane.length == capacity
    plane.landed = true
  end

  def takeoff_plane(plane)
  end

  def check_planes(plane)
  end

end