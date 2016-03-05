class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(a_plane)
    @landed_planes << a_plane
  end

  def take_off(a_plane)
    @landed_planes.delete(a_plane)
  end

  def in_airport?(a_plane)
    @landed_planes.include? a_plane
  end
end
