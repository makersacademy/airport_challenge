require_relative "plane"

class Airport

  attr_reader :plane

  def takeoff
  @plane
  end

  def land(plane)
  @plane = plane
  end

end
