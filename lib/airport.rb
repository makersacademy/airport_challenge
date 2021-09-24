class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def land(plane)
    plane.flying = false
    @planes << plane
  end

  def take_off(plane)
    plane.flying = true
    @planes.delete(plane)
  end
end
