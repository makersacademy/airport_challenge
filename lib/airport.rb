class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.land
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    @planes.pop
    @planes
  end

end
