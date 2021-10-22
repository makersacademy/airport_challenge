class Airport 
  attr_reader :planes, :airborne_planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop()
  end


end