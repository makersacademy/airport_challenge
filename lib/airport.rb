require_relative 'plane'

class Airport
attr_reader :planes_airport, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_airport = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'The airport is full' if planes_airport.count >= capacity
    planes_airport << plane
  end

  def take_off(plane)
  planes_airport.pop
  "In the air"
  end

end
