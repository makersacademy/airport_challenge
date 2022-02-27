require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 30
  
  attr_reader :planes_at_airport
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_at_airport = []
    @capacity = capacity
  end
  
  def land(plane)
    check_for_capacity
    fail "Plane cannot land as it is already on the ground" if plane.whereabouts != :flying
    @planes_at_airport << plane
    plane.log_airport(object_id) # pass the airport object id to the plane
  end

  def takeoff(plane)
    fail "Plane is not at this airport" if planes_at_airport.include?(plane) == false
    planes_at_airport.delete(plane)
    plane.change_status_to_flying
    return "#{plane} has taken off"
  end

  def check_for_capacity
    fail "Airport is at capacity" if @planes_at_airport.length == @capacity
  end

end
