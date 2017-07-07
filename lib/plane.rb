class Plane

  def land(airport)
    "Tower - we have touchdown at #{airport.name}"
  end

  def take_off(airport)
    fail 'Weather is stormy - departure delayed' if airport.stormy?
    "Tower - we are now airborne, leaving #{airport.name}"
  end

end
