require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5

  attr :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is at full capacity' if @planes.length >= DEFAULT_CAPACITY
    @planes << plane
    plane.plane_arrives
  end

  def take_off(plane)
    planes.delete(plane)
    plane.plane_leaves
  end
end

# my_plane = Plane.new
# airport = Airport.new(my_plane)

# # puts my_plane.at_airport?
# # airport.land(my_plane)
# # airport.take_off(my_plane)
# # puts my_plane.at_airport?