class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :capacity # can maybe get rid of this - need to look into refactoring

def initialize(capacity = self.class::DEFAULT_CAPACITY)
  @landed_planes = []
  @capacity = capacity
  @clearance = true
end

def instruct_to_land(plane)
  fail "Clearance for landing not granted: stormy weather" if !@clearance
  fail "Clearance for landing not granted: stormy weather" if at_capacity?
  plane.land
  @landed_planes << plane
  @landed_planes.last
end

def instruct_to_takeoff(plane)
  fail "Clearance for takeoff not granted: stormy weather" if !@clearance
  plane.take_off
  @landed_planes.delete(plane)
end

def clearance(weather)
  @clearance = !weather.stormy?
end

def confirm_status(plane)
  plane.status
end

private

def at_capacity?
  @landed_planes.count == capacity
end

end
