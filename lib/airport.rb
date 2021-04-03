require_relative 'plane'

class Airport

  def initialize
    @runway = []
  end
  
  def land(plane)
    plane = Plane.new
    @runway << plane
  end

  def takeoff(plane)
    @runway.delete(plane)
    return "#{plane} has left the runway."
  end

end
