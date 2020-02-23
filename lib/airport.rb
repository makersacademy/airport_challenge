require_relative "plane"

class Airport

  MAX_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity, :storms

  def initialize(capacity = MAX_CAPACITY)
    @planes = []
    @capacity = capacity 
    @storms = storms
  end

  def land_plane(airplane)
    fail "We have too many planes captain!" if planes.length == capacity
    fail "We have an airplane" if airplane.landed
    fail "There is a storm coming Mr. Wayne" if storms
    airplane.landed = true
    planes << airplane
  end

  def takeoff_plane(airplane)
    fail "There is a storm coming Mr. Wayne" if storms
    fail "Plane has already left" unless airplane.landed
    return airplane if check_planes(airplane) == airplane
    fail "Plane ain't here"
  end

  def check_planes(airplane)
    planes.each_with_index do | check, index |
      next unless check == airplane
      planes.delete_at(index)
      airplane.landed = false
      return airplane
    end
  end

end