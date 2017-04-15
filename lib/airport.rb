class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def dock_plane(plane)
    plane.land
    planes << plane
  end

end
