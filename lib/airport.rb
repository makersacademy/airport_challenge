class Airport
  attr_reader :planes, :capacity
  
  DEFAULT_CAPACITY = 10
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
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
  
  def full?
    return true if @planes.length >= capacity
    false
  end
end