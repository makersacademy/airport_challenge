require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail "This plane is already at the airport" unless !@planes.include?(plane)
    fail "The airport is full, wait please" unless @planes.length < 1
    @planes << plane
  end

  def take_off(plane)
    fail "This plane has already left the airport" unless @planes.include?(plane)
    @planes = @planes - [plane]
  end
end