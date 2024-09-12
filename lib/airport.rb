# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport 
# and confirm that it is no longer in the airport

require_relative 'plane'

class Airport

  # attr_reader :plane
  def initialize
    @parked = []
  end

  def land(plane)
    @plane = plane
    @parked << @plane
  end

  def take_off # (plane)
    @parked.pop(@plane) #n(plane)
  end 
end
