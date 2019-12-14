require 'plane'

class Airport
  airport = Airport.new

  def initialize(capacity: 20)
    @capacity = capacity
  end

  def land(plane)
    airport = Airport.new
    fail "Can't land, stormy" unless airport.clear?
    @plane
  end

  def full
    fail "Can't land, airport full" unless hangar != @plane
  end

  def hangar
    @plane
  end

  def clear?
    false
  end

end
