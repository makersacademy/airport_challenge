class Airport 
  attr_reader :planes, :capacity, :airborne_planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    @airborne_planes.delete(plane)
  end

  def take_off
    @planes.pop
    @airborne_planes << plane
  end
end
