class Plane

  attr_reader :landed, :airport

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
    fail "Plane not at this airport" unless airport == @airport
    fail "Can't take off - weather is stormy" if stormy?(weather)
    @landed = false
    airport.planes.delete(self)
    self
  end

  private

  def stormy?(weather)
    return true if weather.condition == "stormy"
    false
  end

end