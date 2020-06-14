require_relative "plane"

class Airport
  attr_reader :plane
  
  def initialize
    @planes = []
  end
  
  def take_off
    fail "No waiting planes" if @planes.empty?
    
    @planes.pop
  end
  
  def land(plane)
    @plane = plane
    fail "Airport is full" if @planes.count >= 20
    
    @planes << plane
    plane
  end
  
end
