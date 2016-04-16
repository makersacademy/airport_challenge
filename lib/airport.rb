class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.location = self
    @planes << plane
    plane
  end

  def take_off(plane)
    plane.location = "in_the_air"
    @planes.delete(plane)
  end

end
