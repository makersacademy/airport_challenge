require_relative 'plane'

class Airport
  def initialize(capacity = 1)
    @planes = []
    @capacity = capacity

  end

  def land(plane)
    fail "This plane is already at the airport" unless !@planes.include?(plane)
    fail "The airport is full, wait please" unless @planes.length < @capacity
    @planes << plane
  end

  def take_off(plane)
    fail "This plane has already left the airport" unless @planes.include?(plane)
    @planes = @planes - [plane]
  end
end