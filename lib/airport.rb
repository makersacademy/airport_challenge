class Airport
  DEFAULT_CAPACITY = 25
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'At maximum capacity' if @planes.count >= @capacity
    @planes << plane
  end

  def take_off
    true
  end

private 

  def at_capacity
    @planes.size >= capacity
  end 

end
