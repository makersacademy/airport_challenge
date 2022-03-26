class Airport
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
  end
  
  def take_off(plane)
  end

  def full?
    @planes.count >= @capacity
  end

end