require_relative 'airport'

class Plane

  plane = @plane 
  landed_planes = 0 

  def land(plane)
    fail "full" if airport.hangar_space = "full"
#    landed_planes += 1 
  end

  def take_off
  end  
    
end    