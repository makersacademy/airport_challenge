class Airport

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end 

  def land(plane)
    fail 'The airport is full.' if full?
    
    @landed_planes.push(plane)
  end

  def take_off(plane)
  end 

  def full?
    @landed_planes.count >= @capacity
  end 

end
