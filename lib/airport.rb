require 'plane.rb'

class Airport
  attr_reader :bunker, :capacity
  def initialize(capacity = 125)
    @bunker = []
    @capacity = capacity
  end
  def land(plane)
    @bunker << Plane.new
  end
  def takeoff(plane)
    @bunker.pop
  end

end
