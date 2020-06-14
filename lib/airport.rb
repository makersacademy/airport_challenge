require_relative "plane"

class Airport
  attr_reader :plane
  
  def initialize
    @planes = []
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
    @planes.count >= 20
  end
  
  def empty?
    @planes.empty?
  end
  
end
