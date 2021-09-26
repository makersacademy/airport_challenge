class Airport

  attr_reader :plane
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @plane = plane
    @planes_in = []
  end
  
  def land(plane)
    fail 'Airport full' if full?
    @planes_in.push(plane)
    @plane = plane
  end

  def full?
    @planes_in.length == DEFAULT_CAPACITY
  end  

end
