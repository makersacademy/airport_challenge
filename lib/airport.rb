class Airport
  attr_reader :plane, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
  end

  def land(plane)
    fail'Airport is full no landing allowed' if @plane.count >= DEFAULT_CAPACITY 
    @plane << plane
  end
  
  def takeoff(plane)
    @plane.delete(plane)
    return plane
  end
  
end
