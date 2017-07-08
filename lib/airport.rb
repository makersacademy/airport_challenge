class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    plane.land_at(self)
    @planes << plane
  end

  def take_off plane
    fail("Plane is not at this airport!") unless @planes.include?(plane)
    plane.take_off
    @planes -= [plane]
  end

end
