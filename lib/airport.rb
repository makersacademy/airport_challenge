class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end

  def plane_take_off
    @planes.pop
  end

end
