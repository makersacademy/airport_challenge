require 'plane.rb'

class Airport
  attr_reader :bunker
  def initialize
    @bunker = []
  end
  def land(plane)
    @bunker << Plane.new
  end
  def takeoff(plane)
    @bunker.pop
  end
  def capacity
  end
end
