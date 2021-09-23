class Airport
  def initialize
    @planes = []
  end

  attr_reader :planes

  def land(plane)
    plane.flying = false
    @planes << plane
  end
end
