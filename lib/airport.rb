require_relative 'plane'

class Airport

#   def initialize
#     @plane = plane
#   end

  attr_reader :plane

  def land(plane)
    @plane = plane
  end 

  def take_off
    Plane.new
  end 
  
#   def plane
#     @plane
#   end

end