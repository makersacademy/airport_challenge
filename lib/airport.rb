class Airport
  def initialize
    @planes = []
  end

  def add_plane(plane)
    @planes << plane
  end

  def planes
    @planes
  end
end