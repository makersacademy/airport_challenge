require_relative 'plane'

class Airport
  AIRPORT_CAPACITY = 11
  attr_accessor :capacity

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity.to_i
    @planes = Array.new(capacity, Plane.new)
  end

  def land(plane)
    fail
    "Cannot land at this airport as it is full" if @planes.count >= @capacity
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    puts "The plane #{plane} has left the airport."
  end

end
