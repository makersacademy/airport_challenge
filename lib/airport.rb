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

  def plane_depart(plane)
    landed_planes.delete(plane) if weather_generator != "storm"
  end
end
