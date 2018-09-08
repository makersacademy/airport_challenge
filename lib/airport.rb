require_relative 'plane'

class Airport

  attr_reader :grounded_planes

  def initialize
    @grounded_planes = []
  end

  def land(plane)
    p "Plane has landed"
    @grounded_planes << plane
  end

  def takeoff(plane)
    p "Plane has taken off"
    @grounded_planes.shift
    #p @grounded_planes = [] again
  end
end
