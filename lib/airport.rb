require_relative "airport.rb"

class Airport

  def land(plane)
    # fail "Airport full! Plane cannot land" if
    "Plane's landed!"
  end

  def lift(plane)
    "Plane took off and has left airport!"
  end

  def full?
    true
  end

end
