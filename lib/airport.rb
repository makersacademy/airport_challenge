require_relative "plane"

class Airport

  attr_reader :plane

  def land(plane)
    print "Plane has landed\n"
    @plane = plane
  end

  def depart(plane)
    print "Plane has departed\n"
    @plane = plane
  end





end
