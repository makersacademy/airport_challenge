require_relative "plane.rb"

class Airport

plane = Plane.new
  def land(plane)
    # fail "Airport full! Plane cannot land" if full?
    plane
    "Plane has landed"
  end

  def lift(plane)
    "Plane has taken off"

  end

  def full?
    true
  end

end
