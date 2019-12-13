# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
class Airport
  attr_reader :plane

  def takeoff
    fail 'The plane has left the airport' unless @plane

    @plane
  end

  def landing(plane)
    fail 'Airport is full!' if @plane

    @plane = plane
  end

  def plane
    @plane
  end
end

class Plane
end
