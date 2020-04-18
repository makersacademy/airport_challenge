class Airport
  attr_reader :planes
  
  def initialize
    @planes = []
  end
  
  def dock(plane)
    @planes << plane
  end
  
  def undock(plane)
  end
end