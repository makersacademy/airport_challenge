require_relative 'plane'

class Airport
attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
    return plane
  end

  def takeoff(plane)
    planes.pop
    return plane
  end

end
