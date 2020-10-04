class Airport

  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 50
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  def land(plane)
    fail "Airport is full" if full?

    @planes << plane
  end 

  def take_off
    "Plane has taken off"
  end 

  def full?
    @planes.length == @capacity
  end  
end
