class Airport

  def initialize
    @planes = []
  end

  def release_plane(plane)
    @planes.pop
  end

  def land_plane(plane)
    @planes << plane
  end



end
