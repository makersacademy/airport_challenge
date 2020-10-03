require_relative 'plane'

class Airport

  def initialize
    @grounded_planes = []
  end

  def land(plane)
    @plane = plane
  end

  def landed(plane)
    @grounded_planes.push(plane)
  end

end
