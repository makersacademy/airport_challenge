class Airport
  attr_reader :passengers
  attr_reader :landed_planes

  def initialize
    @passengers = []
    @landed_planes = []
  end

  def land_plane(plane)
    landed_planes << plane
  end
end
