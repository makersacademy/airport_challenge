require './lib/plane.rb'

class Airport
  attr_reader :grounded_planes, :capacity

  def initialize(capacity=20)
    @grounded_planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "That plane has already landed" if plane.flying? == "landed"
    raise "There are too many planes in the airport" if full?
    @grounded_planes << plane
    plane.landed
  end

  def takeoff(plane)
    raise "That plane is not in this airport" if !@grounded_planes.include?(plane)
    @grounded_planes.delete(plane)
    plane.taken_off
  end

  def full?
    @grounded_planes.length >= @capacity
  end

end
