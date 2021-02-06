class Plane

  def land(airport)
    raise "Airport full" if airport.full?

    airport.parked += 1
    "Landed at #{airport.name}"
  end

  def takeoff(airport)
    "Departed from #{airport.name}"
  end

end
