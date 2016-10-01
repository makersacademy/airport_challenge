class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    @planes.pop
  end
end
