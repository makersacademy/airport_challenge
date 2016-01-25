class Plane

  def land(airport, weather)
    fail "Plane already landed" if landed
    fail "Can't land when weather is stormy" if stormy?(weather)
    fail "Can't land when airport is at capacity" if airport.full
    @landed = true
    @airport = airport
    airport.planes.push(self)
    self
  end

  def takeoff(airport, weather)
    fail "Plane already airborne" unless landed
    fail "Plane not at this airport" unless docked?(airport)
    fail "Can't take off - weather is stormy" if stormy?(weather)
    @landed = false
    airport.planes.delete(self)
    self
  end

  private

  attr_reader :landed, :airport

  def stormy?(weather)
    return true if weather.condition == "stormy"
    false
  end

  def docked?(airport)
    return true if airport == @airport
    false
  end
end