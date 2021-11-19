require_relative "plane"

class Airport

  attr_reader :plane

  def land(plane)
    fail "Airport full" if @plane
    @plane = plane
  end

  def takeoff
    @plane = nil
  end
end
