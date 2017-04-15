class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def dock_plane(plane)
    plane.docked
    plane.has_landed?
    planes << plane
  end

end
