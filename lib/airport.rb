require_relative 'plane'

class Airport
  attr_reader :planes_airport, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_airport = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'The airport is full' if full?
    planes_airport << plane
  end

  def take_off(plane)
    fail 'It is too stormy to take off' if weather == "stormy"
    planes_airport.pop
    "In the air"
  end

end

private

def full?
  planes_airport.count >= capacity
end
