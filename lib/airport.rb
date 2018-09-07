
class Airport
  attr_accessor :planes
  def initialize
    @plane = Plane.new
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
  end
end
