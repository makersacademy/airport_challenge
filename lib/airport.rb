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
  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def takeoff
    fail 'The plane has left the airport' if empty?

    @planes.pop
  end

  def landing(plane)
    fail 'Airport is full!' if full?

    @planes << plane
  end

  def plane
    @planes
  end

  private
  attr_reader :planes
  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end

class Plane
end
