require_relative "plane"

class Airport

  attr_reader :plane

  def land(plane)
    fail "Airport full" if full?
    @plane = plane
  end

  def takeoff
    @plane = nil
  end

  def full?
    @plane
  end
end
