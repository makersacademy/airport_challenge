require './lib/plane.rb'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    fail "Airport is full, cannot land plane" if hangar.count >= 1
    @hangar << plane
  end

  def takeoff
    puts "Plane #{@hangar[-1]} has taken off"
    @hangar.pop
  end
end