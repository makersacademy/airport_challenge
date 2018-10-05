require_relative 'plane.rb'

class Airport
    
   def initialize
    @planes = []
    @parked = false
   end
    
  def land(plane)
    @parked = true
    @planes << plane
  end
  
  def takeoff
     @parked = false
     @planes.pop
  end
  
  attr_reader :parked
end
