require './lib/plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    plane.landed = true
  end

  def takeoff(plane)
    planes.drop(1)
    plane.landed = false
  end

end
