require_relative 'plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail "This plane is already at the airport" unless !@planes.include?(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "This plane has already left the airport" unless @planes.include?(plane)
    @planes = @planes - [plane]
  end
end