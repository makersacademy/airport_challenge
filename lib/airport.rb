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
  def release_plane
    Plane.new
  end

  def runway(plane)
  end

  def plane
  end

end

class Plane
  def land
  end
end
