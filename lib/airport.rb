class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def plane_take_off
    @planes.shift.take_off

  end

  def plane_landing (plane)
    plane.land
    @planes << plane

  end

end
