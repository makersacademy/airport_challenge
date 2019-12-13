class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes.push(plane)
  end

  def take_off(plane)
    @landed_planes.delete(plane)
  end
end
