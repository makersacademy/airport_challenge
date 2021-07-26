class Airport 
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Cannot land: Weather is stormy' if stormy?
     
    fail 'Airport full: Cannot land' if full?

    @planes << plane
  end

  def take_off(plane)
    fail 'Cannot take off: Weather is stormy' if stormy? 

  end

# private 
  def full?
    @planes.length >= @capacity
  end
  
  def stormy?
    rand(1..10) > 8
    # return true
  end

end

