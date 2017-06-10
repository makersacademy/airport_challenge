class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    @planes.last
  end

  def take_off
    @planes.pop
  end
end
