class Plane

  def land(airport)
    fail 'Weather is stormy - arrival delayed' if airport.stormy?
    "Tower - we have touchdown at #{airport.name}"
  end

  def take_off(airport)
    fail 'Weather is stormy - departure delayed' if airport.stormy?
    "Tower - we are now airborne, leaving #{airport.name}"
  end

end
