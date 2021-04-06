require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 6
  
  attr_accessor :capacity
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end 
  
  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off
    Plane.new
  end

  private

  def full?
    @planes.count >= capacity
  end

end
