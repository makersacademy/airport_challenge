class Airport
  DEFAULT_CAPACITY = 10
  
  attr_accessor :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport is full." if full?
    fail "Weather is stormy. You can't land the plane." if stormy?

    @planes << plane
  end

  def take_off(plane)
    fail "Weather is stormy. You can't take off the plane." if stormy?
    
    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    rand(4) == 0
  end
end
