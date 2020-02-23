require_relative "plane"

class Airport

  MAX_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = MAX_CAPACITY)
    @planes = []
    @capacity = capacity 
  end

  def land_plane(airplane)
    fail "We have too many planes captain!" if planes.length == capacity
    fail "We have an airplane" if airplane.landed
    airplane.landed = true
    planes << airplane
  end

  def takeoff_plane(airplane)
    fail "Plane has already left" unless airplane.landed
  end

  def check_planes(airplane)
    
  end

end