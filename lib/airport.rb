
class Airport

# attr_accessor :clearance_for_landing,

def initialize
#   @clearance_for_landing = true
   @landed_planes = []
   @clearance = true
#   puts planes
 end

def clearance(weather)
  @clearance = weather.stormy?
end


def instruct_to_land(plane)
  fail "Clearance for landing not granted: stormy weather" if @clearance == false
  plane.land
  @landed_planes << plane
  @landed_planes.last
end

def instruct_to_takeoff(plane)
  fail "Clearance for landing not granted: stormy weather" if @clearance == false
  plane.take_off
  @landed_planes.delete(plane)
end

def confirm_status(plane)
  plane.status
end

end
