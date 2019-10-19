require './lib/plane.rb'

class Airport
  attr_reader :grounded_planes

  def initialize
    @grounded_planes = []
  end

  def land(plane)
    raise "That plane has already landed" if plane.flying? == "landed"
    @grounded_planes << plane
    plane.landed
  end

  def takeoff(plane)
    raise "That plane is not in this airport" if !@grounded_planes.include?(plane)
    @grounded_planes.delete(plane)
    plane.taken_off
  end

end
