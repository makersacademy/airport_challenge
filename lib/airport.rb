# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
class Airport
  attr_reader :plane

  def release_plane
    @plane
  end

  def runway(plane)
    @plane = plane
  end

  def plane
    @plane
  end
end

class Plane
  def land
  end
  
  def takeoff
  end
end
