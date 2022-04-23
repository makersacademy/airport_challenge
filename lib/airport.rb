class Airport
  DEFAULT_CAPACITY = 10
  
  attr_accessor :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    p @planes.delete(plane)

  end

  def full?
    return true if @planes.count >= @capacity
    return false if @planes.count < @capacity
  end
end
