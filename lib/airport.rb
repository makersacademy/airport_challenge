class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def dock_plane(plane)
    plane.land
    planes << plane
  end

  def release_plane(plane)
    plane.take_off
  end

end
