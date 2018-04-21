class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def plane_lands(plane)
    plane.land
    @planes << plane
  end

  def plane_takes_off(plane)
    plane.take_off
    @planes.delete(plane)
  end

end
