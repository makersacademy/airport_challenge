class Airport
  attr_reader :landed_planes

  def initialize(landed_planes = [])
    @landed_planes = landed_planes
  end

  def land(plane)
    @landed_planes << plane
  end

  def take_off(plane)
    @landed_planes.delete(plane)
  end
end
