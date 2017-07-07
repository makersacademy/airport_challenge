class Plane

  def land(airport)
    fail 'Weather is stormy - arrival delayed' if airport.stormy?
    fail 'Flight - airport is at capacity. Maintain holding!' if airport.full?
    "Tower - we have touchdown at #{airport.name}"
  end

  def take_off(airport)
    fail 'Weather is stormy - departure delayed' if airport.stormy?
    "Tower - we are now airborne, leaving #{airport.name}"
  end

end
