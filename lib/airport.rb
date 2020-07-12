require "./lib/plane.rb"

class TrafficControl
  attr_reader :runway
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @runway = []
  end
  
  def land(plane)
    fail "Runway at maximum capacity" if full?
    
    @runway << plane
  end
  
  def takeoff(plane)
    @runway.delete(plane)
  end
  
  def show_runway
    @runway
  end
  
  def full?
    @runway.count >= @capacity
  end
end
