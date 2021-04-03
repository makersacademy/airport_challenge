require_relative 'plane'

class Airport
DEFAULT_CAPACITY = 20
  def initialize
    @runway = []
  end
  
  def land(plane)
    plane = Plane.new
    fail "Sorry, Airport packed over capacity" if full?
    @runway << plane
  end

  def takeoff(plane)
    @runway.delete(plane)
    return "#{plane} is in the clouds"
  end

  private
  
  def full?
    @runway.length >= DEFAULT_CAPACITY
  end

end
