

class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes << plane
  end

  def takeoff(plane)
    planes.delete(plane)
  end

end
