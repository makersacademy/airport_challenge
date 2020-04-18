class Airport
  attr_reader :planes, :capacity
  
  def initialize
    @planes = []
  end
  
  def dock(plane)
    @planes << plane
  end
  
  def undock(plane)
    @planes.delete(plane)
  end
  
  def docked?(plane)
    @planes.include?(plane)
  end
end