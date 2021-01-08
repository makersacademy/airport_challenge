class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    @planes.delete(plane)    
  end

  attr_reader :planes
end
