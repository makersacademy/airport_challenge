require 'plane.rb'

class Airport
  attr_reader :bunker, :capacity
  DEFAULT_CAPACITY = 125
  def initialize(capacity = DEFAULT_CAPACITY)
    @bunker = []
    @capacity = capacity
  end
  def land(plane)
    return raise "Do not land, airport is full" if (@bunker.length >= @capacity)
    @bunker << Plane.new
  end
  def takeoff(plane)
    @bunker.pop
  end

end
