require_relative 'plane'

class Airport

  def initialize
    @landed_planes = []
    @taken_off_planes = []
    @capacity = 2
  end

  def plane_land(plane) 
    # # "Plane needs to land"
    fail 'Airport is full' if full? 
    @landed_planes.push(plane)
    return true
  end 

  def plane_take_off
    # "Plane please take off from airport"
    @landed_planes.pop
    return true 
    # @taken_off_planes.push(plane)
  end 


private

def full?
  @landed_planes.count >= @capacity 
end

end 


# airport = Airport.new
# puts airport.plane_land(Plane.new)
# puts airport.plane_land(Plane.new)
# puts airport.plane_take_off

