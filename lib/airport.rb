require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 20
  
  attr_reader :plane
  attr_reader :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  
  def take_off
    fail "No waiting planes" if empty?
    
    @planes.pop
  end
  
  def land(plane)
    @plane = plane
    fail "Airport is full" if full?
    
    @planes << plane
    plane
  end
  
  private
  
  def full?
    @planes.count >= @capacity
  end
  
  def empty?
    @planes.empty?
  end
  
end
