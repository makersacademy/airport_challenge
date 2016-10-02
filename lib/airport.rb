class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.land
    @planes.push(plane)
  end

  def take_off(plane)
    plane.take_off
    @planes.delete(plane)
  end
end
