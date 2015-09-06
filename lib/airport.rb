class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def plane_take_off
    @planes[0].take_off
    planes.shift

  end

  def plane_landing (plane)
    plane.land
    @planes << plane

  end

end
