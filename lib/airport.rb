require_relative "plane"

class Airport

  attr_reader :plane

  def takeoff
  Plane.new
  end

  def land(plane)
  @plane = plane
  end

end
