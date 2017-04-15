class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def dock_plane(plane)
    planes << plane
    plane.docked
  end

end
