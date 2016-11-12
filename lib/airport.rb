class Airport

  attr_reader :planes
  def initialize
    @planes = []
  end

  def park_plane(plane)
    @planes << plane
  end

  def unpark_plane(plane)
    @planes -= [plane]
  end

end
