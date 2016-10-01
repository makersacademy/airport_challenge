
class Airport

# attr_accessor :clearance_for_landing,

def initialize
#   @clearance_for_landing = true
   @landed_planes = []
#   puts planes
 end

def clearance_for_landing
  @clearance_for_landing

end

def instruct_to_land(plane)
  plane.land
  @landed_planes << plane
  @landed_planes.last
end

def instruct_to_takeoff(plane)
  plane.take_off
  @landed_planes.delete(plane)  
end

def confirm_status(plane)
  plane.status
end

end
