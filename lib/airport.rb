class Airport 
  attr_accessor :planes, :default_capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport at full capacity" if full?
    @planes << plane
  end

  def depart
    @planes.pop
  end

private 

  def full? 
    @planes.count >= @capacity
  end
end
