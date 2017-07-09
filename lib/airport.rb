class Airport

  DEFAULT_CAPACITY = 20
  
  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
  end
end
