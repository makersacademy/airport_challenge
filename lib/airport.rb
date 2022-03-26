class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
  end
  
  def take_off
    @planes.shift
  end

  def full?
    @planes.count >= @capacity
  end

end