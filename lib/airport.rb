require_relative "plane"

class Airport

  attr_reader :plane

  def land(plane)
    print "Plane has landed"
    @plane = plane
  end

  def plane
    @plane
  end





end
