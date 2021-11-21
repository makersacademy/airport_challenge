
require_relative 'plane'

class Airport

  def initialize
    @plane = plane
  end

  attr_reader :plane

  def land(plane)
    fail 'Airport is full' if @plane
   @plane  = plane
    
  end 

  def take_off
    Plane.new
  end 
  
#   def plane
#     @plane
#   end

end