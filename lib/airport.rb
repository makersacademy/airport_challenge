require_relative 'plane'
class Airport  
  attr_reader :capacity
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity

  end

  def land(plane)
    fail "Airport is Full" if full?
    fail "Cannot land plane as weather is stormy " if stormy?
    @planes.push(plane) 
  end

  def take_off(*)
    
  end

  private

  def stormy?
    rand(6) <= 2
  end

  def full?
    @planes.count >= @capacity
  end
end
