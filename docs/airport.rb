
class Airport

attr_reader :planes
attr_reader :capacity
DEFAULT_CAPACITY = 20
   
  def intialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end 

  def land(plane)
    fail "Cannot land plane: airport is full" if @planes
    @planes = plane
  end 

  def take_off(plane)
  end 

  def full
    @planes.count >= DEFAULT_CAPACITY
  end 

  def plane_at_the_airport(plane)
    @planes.include?(plane)
  end

end 