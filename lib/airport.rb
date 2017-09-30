require_relative "plane"

class Airport

  attr_reader :plane

  def takeoff
  @plane
  end

  def land(plane)
    fail "Airport full" if @plane
  @plane = plane
  end

end
