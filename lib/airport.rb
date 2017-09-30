require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
    @capacity = 1
  end

  def land(plane)
    @planes << plane
    plane.land
    plane
  end

  def takeoff(plane)
    planes.delete(plane)
    plane.takeoff
    plane
  end

end
