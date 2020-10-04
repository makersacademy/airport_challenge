class Airport

  attr_reader :capacity, :planes, :weather
  DEFAULT_CAPACITY = 50
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    
  end
  
  def land(plane)

    fail "Airport is full" if full?

    fail "can not land, weather is too stormy" if stormy?
   
    @planes << plane
  end 
 
  def take_off
    fail "can not take off, weather is too stormy" if stormy?

    @planes.pop
  end 

  def full?
    @planes.length >= @capacity
  end  
 
  def stormy?
    random == 8
  end

  def random
    rand(1..8)
  end
end
