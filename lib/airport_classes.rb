class Airport
  attr_accessor :runway
  def initialize
    @runway = []
  end

  def land(plane)
    @runway << plane
  end

  def takeoff(plane)
    @runway.delete(plane)
    return plane
  end
end

class Plane

end
